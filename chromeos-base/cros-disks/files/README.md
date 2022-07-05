### remove_nosymfollow.patch
It's a workaround for fydeos fuse mount. There is no option named "nosymfollow" in mainstream kernel. Google add it in kernel for double checking. If we mount device with flags MS_NOSYMFOLLOW, we don't need adding it in options. Our kernel cann't parse this options for unknown reason, so just bypass it.
