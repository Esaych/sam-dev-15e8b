#!/bin/bash
for i in *.png; do
  j=$(echo -n $i | sed -e 's/.png/.jpeg/g')
  echo "--converting $i to $j"
  sips -s format jpeg "$i" --out "$j"
done