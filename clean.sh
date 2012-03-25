#!/bin/sh
test $# -eq 0 && echo "USAGE: $(basename $0) <releaseID> [PATCHES]" && exit

hg qpop -a
tip=$(hg tip | awk '/^[0-9]/ {gsub("\\[.*", "", $1); print $1 "_" $2}')
release="$1"
shift
mkdir -p "$release/${tip}"

cp .hg/patches/README "$release/${tip}/"

#for i in $(find .hg/patches -maxdepth 1 -type f -not -iname \*configh\* -not -iname broken_\* -not -iname inmain_\* -name \*.patch -printf "%f\n")
for i in $(cat .hg/patches/series | grep -v personal_configh | grep -v broken | cut -f1 -d\ )
do
    hg qguard $i +$i
	if [[ $# -ge 1 ]]; then
		found=
		for j in "$@"
		do
			if [[ "$i" = "$j" ]]; then
				found=1
			fi
		done
		if [[ -z "$found" ]]; then
			continue
		fi
	fi
    echo
    echo $i
    hg qselect $i
    rm -f config.h
    if ! hg qpush; then
        echo "Please fix the problem manually"
        exit 1
    fi
    make || exit 1
    hg qrefresh
	diffname=$(echo $i | sed -e 's/\.patch$/.diff/')
	cp -v .hg/patches/$i "$release/${tip}/dwm-$release-${diffname}"
    hg qpop -a
done
