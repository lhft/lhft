#!/bin/bash

for i in transform_*.html
do
f="$(echo "$i" | cut -d"_" -f2)"
echo $f
sed "/:-)main-copy/{r $i
;d}" <bones.azkuml > "$f"
done 

