#!/bin/sh

if [ -n "${1}" ]; then
  for f in ${*}; do
    deccrc=$(gzip -1 -c ${f} | tail -c8 | hexdump -n4 -e '"%u"')
    printf '%08x        %s\n' ${deccrc} ${f}
  done
fi
