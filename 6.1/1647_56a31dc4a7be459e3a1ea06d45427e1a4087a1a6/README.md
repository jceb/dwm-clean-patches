# Installation

## clone patches repository including the dwm repository

    git clone https://github.com/jceb/dwm-patches

## init and load dwm submodule

    cd dwm-patches
    git submodule update --init --recursive

## activate all patches, including the personal configuration

    quilt push -a

## build dwm (or us the ./build script)

    cd dwm
    rm -f config.h
    make

# Patch References

* [attachabove.patch](patches/attachabove.patch)                         (http://dwm.suckless.org/patches/attachabove)
* [float_border_color2.patch](patches/float_border_color2.patch)         (http://dwm.suckless.org/patches/historical/float_border_color)
* [focusmaster.patch](patches/focusmaster.patch)                         (no URL yet)
* [gaplessgrid.patch](patches/gaplessgrid.patch)                         (http://dwm.suckless.org/patches/gapless_grid)
* [keepfloatingposition.patch](patches/keepfloatingposition.patch)       (no URL yet)
* [maximize_vert_horz.patch](patches/maximize_vert_horz.patch)           (http://dwm.suckless.org/patches/maximize)
* [moveresize.patch](patches/moveresize.patch)                           (http://dwm.suckless.org/patches/moveresize)
* [pertag.patch](patches/pertag.patch)                                   (http://dwm.suckless.org/patches/pertag)
* [push.patch](patches/push.patch)                                       (http://dwm.suckless.org/patches/push)
* [restart.patch](patches/restart.patch)                                 (no URL yet)
* [save_floats.patch](patches/save_floats.patch)                         (http://dwm.suckless.org/patches/historical/save_floats)
* [shifttags.patch](patches/shifttags.patch)                             (no URL yet)
* [single_tagset.patch](patches/single_tagset.patch)                     (http://dwm.suckless.org/patches/single_tagset)
* [single_window_no_border.patch](patches/single_window_no_border.patch) (http://dwm.suckless.org/patches/noborder)
* [statusallmons.patch](patches/statusallmons.patch)                     (http://dwm.suckless.org/patches/statusallmons)
* [swapfocus.patch](patches/swapfocus.patch)                             (http://dwm.suckless.org/patches/swapfocus)
* [systray.patch](patches/systray.patch)                                 (http://dwm.suckless.org/patches/systray)
* [tagall.patch](patches/tagall.patch)                                   (http://dwm.suckless.org/patches/tagall)
* [toggleview_focus_client.patch](patches/toggleview_focus_client.patch) (no URL yet)
* [zoomswap.patch](patches/zoomswap.patch)                               (http://dwm.suckless.org/patches/zoomswap)

# Patches, Not Maintained

* [disable_focus_stealing.patch](patches/disable_focus_stealing.patch)   (no URL yet)
* [raiselower.patch](patches/raiselower.patch)                           (http://dwm.suckless.org/patches/historical/raiselower)
