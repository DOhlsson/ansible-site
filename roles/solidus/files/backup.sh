#!/bin/bash

backup_dir=/tank/trbg
date=$(date +%Y-%m-%d)

# to enable the much slower rsync checksum for file difference calculation
if [[ "$1" == "--checksum" ]]; then
  checksum_flag=$1
fi

rsync -rv $checksum_flag --delete pallastv:/mnt/hdd/Data/ ${backup_dir}/data/ > ${backup_dir}/rsync_stdout.log 2> ${backup_dir}/rsync_stderr.log

/sbin/zfs snapshot tank/trbg@backup-$date
