#!/usr/bin/python
import xml.etree.ElementTree as ET
import sys
####<?xml version="1.0" encoding="UTF-8" standalone="yes"?><set><members><member><id>010000690077</id></member></members></set>

root = ET.Element("set")
members = ET.SubElement(root, "members")
for line in sys.stdin:
    line = line.rstrip("\n")
    member = ET.SubElement(members, "member")
    id = ET.SubElement(member, "id").text = line

tree = ET.tostring(root, encoding='utf-8', method='xml')
print tree

sys.exit()
