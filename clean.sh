#!/bin/sh -x
test $# -eq 0 && echo "USAGE: $(basename $0) <releaseID>" && exit

hg qpop -a
tip=$(hg identify | awk '{print $1}')
mkdir -p "$*/${tip}"

cp .hg/patches/README "$*/${tip}/"

#for i in $(find .hg/patches -maxdepth 1 -type f -not -iname \*configh\* -not -iname broken_\* -not -iname inmain_\* -name \*.patch -printf "%f\n")
for i in $(cat .hg/patches/series | grep -v personal_configh | grep -v broken | cut -f1 -d\ )
do
    echo
    echo $i
    hg qguard $i +$i
    hg qselect $i
    rm -f config.h
    if hg qpush; then
        diffname=$(echo $i | sed -e 's/\.patch$/.diff/')
        cp -v .hg/patches/$i "$*/${tip}/dwm-$*-${diffname}"
    else
        echo Please fix the problem manually
        exit 1
    fi
    make || exit 1
    hg qrefresh
    hg qpop -a
done
