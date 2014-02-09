dwm-clean-patches
=================

This repository contains a selection of patches for different versions of dwm.
For every version of dwm there is a directory. Every directory contains with the
changeset id as its name. Below this directory the patches are stored, together
with a detailed README file.

The two scripts `clean.mk` and `clean.sh` are used for creating clean patches.
The tools `git` and `quilt` are required for modifying the patches.

## Installation

Check out the dwm-patches repository:

  $ git clone https://github.com/jceb/dwm-patches
  $ cd dwm-patches

Check out the dwm-clean-patches repository:

  $ git clone https://github.com/jceb/dwm-clean-patches

Create symlinks to `clean.mk` and `clean.sh`:

  $ ln -s dwm-clean-patches/clean.* .

## Usage

Update all patches from the dwm-patches repository to apply cleanly against the
tip of the dwm repository:

  $ ./clean.mk

Certainly errors will occur when running the above command. Fix the error and
run:

  $ export QUILT_SERIES=single_series
  $ quilt refresh

Continue updating patches till all apply cleanly:

  $ ./clean.mk

Specific patches can be updated by passing them as arguments:

  $ ./clean.mk args="PATCH1 [PATCH2]"

Finally upload the resulting directory containing only patches that apply
cleanly against the tip of the dwm repository:

  $ cp -r $VERSION dwm-clean-patches/
  $ cd dwm-clean-patches
  $ git add $VERSION

Don't forget to revert the changes you did to the patches of the dwm-patches
repository:

  $ git checkout -- patches/*
