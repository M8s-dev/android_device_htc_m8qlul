#!/bin/bash

#set -e
export DEVICE=m8qlul
export VENDOR=htc

if [ $# -eq 0 ]; then
  SRC=adb
else
  if [ $# -eq 1 ]; then
    SRC=$1
  else
    echo "$0: bad number of arguments"
    echo ""
    echo "usage: $0 [PATH_TO_EXPANDED_ROM]"
    echo ""
    echo "If PATH_TO_EXPANDED_ROM is not specified, blobs will be extracted from"
    echo "the device using adb pull."
    exit 1
  fi
fi

function extract() {
    for FILE in `egrep -v '(^#|^$)' $1`; do
      OLDIFS=$IFS IFS=":" PARSING_ARRAY=($FILE) IFS=$OLDIFS
      FILE=`echo ${PARSING_ARRAY[0]} | sed -e "s/^-//g"`
      DEST=${PARSING_ARRAY[1]}
      if [ -z $DEST ]
      then
        DEST=$FILE
      fi
      DIR=`dirname $DEST`
      if [ ! -d $BASE/$DIR ]; then
        echo DEBUG mkdir -p $BASE/$DIR
        mkdir -p $BASE/$DIR
      fi
      # Try CM target first
      if [ "$SRC" = "adb" ]; then
        echo DEBUG adb pull /system/$DEST $BASE/$DEST
        adb pull /system/$DEST $BASE/$DEST
        # if file does not exist try OEM target
        if [ "$?" != "0" ]; then
            echo DEBUG adb pull /system/$FILE $BASE/$DEST
            adb pull /system/$FILE $BASE/$DEST
          if [ "$?" != "0" ]; then
            echo "UNFOUND /system/$DEST AND /system/$FILE" >&2
          fi
        fi
      else
        if [ -z $SRC/system/$DEST ]; then
            echo ":: $DEST"
            echo DEBUG cp $SRC/system/$DEST $BASE/$DEST
            cp $SRC/system/$DEST $BASE/$DEST
        else
            echo ":: $FILE"
            echo DEBUG cp $SRC/system/$FILE $BASE/$DEST
            cp $SRC/system/$FILE $BASE/$DEST
        fi
      fi
    done
}

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary
echo rm -rf $BASE/*
rm -rf $BASE/*

echo extract ../../$VENDOR/$DEVICE/proprietary-files-qc-m8qlul.txt $BASE
extract ../../$VENDOR/$DEVICE/proprietary-files-qc-m8qlul.txt $BASE
echo extract ../../$VENDOR/$DEVICE/proprietary-files-m8qlul.txt $BASE
extract ../../$VENDOR/$DEVICE/proprietary-files-m8qlul.txt $BASE

./setup-makefiles-debug-m8qlul.sh
