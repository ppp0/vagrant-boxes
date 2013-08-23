#!/bin/sh -e
cd $(dirname $0)

veewee vbox build --force debian-7-amd64-plain
/usr/bin/vagrant package --base debian-7-amd64-plain --output debian-7-amd64-plain.box
s3cmd put debian-7-amd64-plain.box s3://s3.cargomedia.ch/vagrant-boxes/

s3cmd setacl --acl-public --recursive s3://s3.cargomedia.ch/vagrant-boxes/
