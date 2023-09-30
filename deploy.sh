#!/bin/sh

echo "Deleting old publication"
#rm -f hugo.toml
rm -rf publicTmp
mkdir publicTmp

echo "Generating site"
npm run build
echo "Copying to gh-pages"
echo 'www.i94card.com' >> publicTmp/CNAME
cp -a publicTmp/. ../gh-pages
# cd ../gh-pages
cd ../gh-pages && git add --all && git commit -m "gh-pages branch `date`"
echo "Pushing to github gh-pages branch"
git push origin gh-pages
# HUGO_ENV=production  hugo # -t "ananke"


echo "Updating builder branch"
cd ../builder && rm -rf publicTmp && git add --all && git commit -m "Saving to builder branch"

git push