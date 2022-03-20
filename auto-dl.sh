#!/bin/sh

while : ; do
    out=$(./swetest $@)
    missing=$(echo "$out"| grep -o "SwissEph file '.*' not found in PATH" | sed -n "s/.*'\(.*\)'.*/\1/p") 
    [[ -z "$missing" ]] && break
    echo "$missing"| while read -r file; do ncftpget "ftp://ftp.astro.ch/pub/swisseph/ephe/$file"; done
done
echo "$out"
