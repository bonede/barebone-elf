#!/bin/bash
for f in *.dump ; do
    a=`basename $f .dump`
    cut -d'#' -f1 <$f | xxd -p -r >$a
    chmod +x $a
done