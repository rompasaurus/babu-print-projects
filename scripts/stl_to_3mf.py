#!/usr/bin/env python3
"""Minimal STL → 3MF converter.

Produces a mesh-only 3MF with no baked slicer settings. Bambu Studio
opens it, you pick printer + filament profiles, and slice normally.

Usage:
    stl_to_3mf.py input.stl output.3mf
"""
import struct
import sys
import zipfile

CONTENT_TYPES = b"""<?xml version="1.0" encoding="UTF-8"?>
<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">
 <Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>
 <Default Extension="model" ContentType="application/vnd.ms-package.3dmanufacturing-3dmodel+xml"/>
</Types>
"""

RELS = b"""<?xml version="1.0" encoding="UTF-8"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
 <Relationship Target="/3D/3dmodel.model" Id="rel-1" Type="http://schemas.microsoft.com/3dmanufacturing/2013/01/3dmodel"/>
</Relationships>
"""


def read_stl(path):
    with open(path, "rb") as f:
        data = f.read()
    if data[:5] == b"solid" and b"facet normal" in data[:2048]:
        return _read_ascii(data.decode("utf-8", errors="ignore"))
    return _read_binary(data)


def _read_binary(data):
    n = struct.unpack("<I", data[80:84])[0]
    off = 84
    vmap = {}
    vlist = []
    tris = []
    for _ in range(n):
        # skip normal (12 bytes), read 3 vertices (36 bytes), skip attrib (2 bytes) = 50
        base = off + 12
        v1 = struct.unpack("<fff", data[base:base + 12])
        v2 = struct.unpack("<fff", data[base + 12:base + 24])
        v3 = struct.unpack("<fff", data[base + 24:base + 36])
        off += 50
        idx = []
        for v in (v1, v2, v3):
            i = vmap.get(v)
            if i is None:
                i = len(vlist)
                vmap[v] = i
                vlist.append(v)
            idx.append(i)
        tris.append((idx[0], idx[1], idx[2]))
    return vlist, tris


def _read_ascii(text):
    vmap = {}
    vlist = []
    tris = []
    cur = []
    for line in text.splitlines():
        line = line.strip()
        if line.startswith("vertex"):
            parts = line.split()
            v = (float(parts[1]), float(parts[2]), float(parts[3]))
            i = vmap.get(v)
            if i is None:
                i = len(vlist)
                vmap[v] = i
                vlist.append(v)
            cur.append(i)
            if len(cur) == 3:
                tris.append(tuple(cur))
                cur = []
    return vlist, tris


def write_3mf(vertices, triangles, out_path):
    parts = [
        b'<?xml version="1.0" encoding="UTF-8"?>\n',
        b'<model unit="millimeter" xml:lang="en-US" xmlns="http://schemas.microsoft.com/3dmanufacturing/core/2015/02">\n',
        b' <resources>\n  <object id="1" type="model">\n   <mesh>\n    <vertices>\n',
    ]
    for x, y, z in vertices:
        parts.append(f'     <vertex x="{x:.4f}" y="{y:.4f}" z="{z:.4f}"/>\n'.encode())
    parts.append(b"    </vertices>\n    <triangles>\n")
    for a, b, c in triangles:
        parts.append(f'     <triangle v1="{a}" v2="{b}" v3="{c}"/>\n'.encode())
    parts.append(b"    </triangles>\n   </mesh>\n  </object>\n </resources>\n")
    parts.append(b' <build>\n  <item objectid="1"/>\n </build>\n</model>\n')
    model_xml = b"".join(parts)

    with zipfile.ZipFile(out_path, "w", zipfile.ZIP_DEFLATED, compresslevel=6) as z:
        z.writestr("[Content_Types].xml", CONTENT_TYPES)
        z.writestr("_rels/.rels", RELS)
        z.writestr("3D/3dmodel.model", model_xml)


def main():
    if len(sys.argv) != 3:
        print("usage: stl_to_3mf.py INPUT.stl OUTPUT.3mf", file=sys.stderr)
        sys.exit(2)
    stl_in, mf3_out = sys.argv[1], sys.argv[2]
    print(f"[stl_to_3mf] reading {stl_in}", file=sys.stderr)
    verts, tris = read_stl(stl_in)
    print(f"[stl_to_3mf]   {len(verts):,} verts, {len(tris):,} tris", file=sys.stderr)
    print(f"[stl_to_3mf] writing {mf3_out}", file=sys.stderr)
    write_3mf(verts, tris, mf3_out)
    print("[stl_to_3mf] done", file=sys.stderr)


if __name__ == "__main__":
    main()
