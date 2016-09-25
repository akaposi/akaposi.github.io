#!/bin/sh

REDIRECT_REPO=../redirect
NEW_WEBSITE=https://akaposi.github.io

echo "remove old stuff from $REDIRECT_REPO"

NOW=`pwd`
cd $REDIRECT_REPO
if [ $? -ne 0 ]; then echo ERROR; exit; fi
rm -rf *
cd $NOW

echo "generate new stuff into $REDIRECT_REPO"

for f in `find . -not -path '\./\.*' -not -path '\.' -not -path '.*~' -not -path '.*index.html' | sed 's/..\(.*\)/\1/'`
do
    echo $f
    mkdir -p $REDIRECT_REPO/$f
    cp redirect.html $REDIRECT_REPO/$f/index.html
    REPLACE=$NEW_WEBSITE\/$f
    sed -i -e "s/xxx/$(echo $REPLACE | sed -e 's/\\/\\\\/g; s/\//\\\//g; s/&/\\\&/g')/g" $REDIRECT_REPO/$f/index.html
done

cp redirect.html $REDIRECT_REPO/index.html
REPLACE=$NEW_WEBSITE
sed -i -e "s/xxx/$(echo $REPLACE | sed -e 's/\\/\\\\/g; s/\//\\\//g; s/&/\\\&/g')/g" $REDIRECT_REPO/index.html

echo "push everything"

cd $REDIRECT_REPO
git add *
git commit -a -m automatic_commit
git push

cd $NOW
