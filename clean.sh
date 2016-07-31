#!/bin/sh
test $# -eq 0 && echo "USAGE: $(basename $0) <dwm version> [PATCHES]" && exit

export QUILT_PATCHES="${QUILT_PATCHES:=patches}"
export QUILT_SERIES="single_series"

set -u
set -e

quilt pop -a || true

release="$1"
shift
if [ -z "${release}" ]; then
	echo 'Unable to find a release.'
	exit 1
fi
date="$(date +%Y%m%d)"
rev="$(cd dwm && git rev-parse --short HEAD)"
rev_dir="$(cd dwm && git rev-parse HEAD)"
commitcount="$(cd dwm && git log --format=format:%H | wc -l)"
tag="$(cd dwm && git tag -l "${release}")"
if [ -n "${tag}" ] && [ "${rev}" = "$(cd dwm && git rev-parse --short "${tag}")" ]; then
	rev_dir="${rev_dir}_${tag}"
	rev="${tag}"
else
    rev="${date}-${rev}"
fi

mkdir -p "${release}/${commitcount}_${rev_dir}"

cp README.md "${release}/${commitcount}_${rev_dir}/"

cat "${QUILT_PATCHES}/series" | grep -v personal_configh | grep -v broken | grep -v ^# | grep -v disabled | while read i; do
	patch="$(echo "${i}" | cut -f1 -d\ )"
	if [ $# -ge 1 ]; then
		found=
		for j in "${@}"
		do
			if [ "${patch}" = "${j}" ]; then
				found=1
			fi
		done
		if [ -z "${found}" ]; then
			continue
		fi
	fi

	echo
	echo "${patch}"
	echo "${i}" > "${QUILT_PATCHES}/${QUILT_SERIES}"
	rm -f dwm/config.h
	if ! (quilt push -f <&-); then
		echo "Please fix the problem manually"
		exit 1
	fi
	(cd dwm && make)
	quilt refresh

	diffname="${patch%.patch}-${rev}.diff"
	cp -v "${QUILT_PATCHES}/${patch}" "${release}/${commitcount}_${rev_dir}/dwm-${diffname}"
	quilt pop
done
