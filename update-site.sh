#! /bin/bash
mkdocs build
rm -rf docs/
mv site/ docs/
git add -A
git commit -m "updated site"
git push origin master
