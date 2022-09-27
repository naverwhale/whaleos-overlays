# How to update containerd

Find the link to the source tarball on the github release page. For example,
https://github.com/containerd/containerd/releases/tag/v1.2.9. Download it and
upload to the Chrome OS local mirror. For example, to upgrade to `v1.2.9`:

```
# Better do this outside the chroot otherwise gsutil will complain
$ wget https://github.com/containerd/containerd/archive/v1.2.9.tar.gz
$ gsutil cp -n -a public-read v1.2.9.tar.gz \
    gs://chromeos-localmirror/distfiles/containerd-1.2.9.tar.gz
```

Update the `CONTAINERD_COMMIT` variable. It's supposed to be the commit ID of
the tagged release. You can find the full SHA1 for the commit on the github
release page, e.g., by clicking on the abbreviated SHA1 right under the tag.

Then the usual uprev:

```
$ mv containerd-<old>.ebuild containerd-<new>.ebuild
$ ln -s containerd-<new>.ebuild containerd-<new>-r1.ebuild
$ rm containerd-<old>-r1.ebuild
$ ebuild-lakitu containerd-<new>.ebuild manifest
$ git commit -a 'lakitu: Updated containerd to v1.2.9'
```
