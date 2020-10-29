#!/bin/bash -e

POOL=$1
SRC=$2
DST=$3

src_count=`ssh $SRC zfs list -t snapshot $POOL |wc -l`
dst_count=`ssh $SRC zfs list -t snapshot $POOL |wc -l`
src_last_snapshot=`ssh $SRC zfs list -t snapshot $POOL |grep -v NAME |awk '{print $1}' |sort |tail -1`
dst_last_snapshot=`ssh $DST zfs list -t snapshot $POOL |grep -v NAME |awk '{print $1}' |sort |tail -1`
src_first_snapshot=`ssh $SRC zfs list -t snapshot $POOL |grep -v NAME |awk '{print $1}' |sort |head -1`
dst_first_snapshot=`ssh $DST zfs list -t snapshot $POOL |grep -v NAME |awk '{print $1}' |sort |head -1`

if [[ "$src_first_snapshot" != "$dst_first_snapshot" ]]; then
         ssh $SRC zfs send $src_first_snapshot |ssh $DST zfs recv $POOL -F
fi
ssh $SRC zfs send -I $src_first_snapshot $src_last_snapshot |ssh $DST zfs recv $POOL
