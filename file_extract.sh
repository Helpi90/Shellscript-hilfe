#!/bin/bash
#======================================== ==================================
#     FILE:             file_extract.sh
#     AUTHOR:           macbook
#     EMAIL:            helpi9007@gmail.com
#     CREATED:          2017-11-19
#
#     MODIFIED BY:      macbook
#     MODIFIED DATE:    2017-11-19
#
#     DESCRIPTION:      "Beschreibung"
#
#     VERSION:           1.0
#======================================== ==================================

file $1 grep bzip > /tmp/bzip
file $1 grep gzip > /tmp/gzip

if test -s /tmp/bzip; then # wenn /tmp/bzip mindestens 1 Byte groß ist => bzip Datei
  bunzip2 -c $1 tar xv
fi

if test -s /tmp/gzip; then # wenn /tmp/gzip mindestens 1 Byte groß ist => gzip Datei
  tar xfvz $1
fi

rm /tmp/gzip
rm /tmp/bzip
