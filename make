#!/bin/bash
mkdir -p build
while read options
do
  echo -n "$options" > build/options.json
  cftemplate form.cftemplate build/options.json > build/form.cform
  DIGEST=$(commonform hash < build/form.cform)
  mv build/form.cform "build/$DIGEST.cform"
  rm -f build/options.json
done < variations.ndjson
