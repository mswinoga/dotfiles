#!/bin/sh

function linkFiles() {
  for FILE in $DOTDIR/*; do
    DOTFILE=$HOME/.${FILE##*/}
    if [ $FILE != $0 ]; then
      if [ -e $DOTFILE ]; then
        mv $DOTFILE ${DOTFILE}.dotbak
      fi
      ln -s $FILE $DOTFILE
    fi
  done
}

DOTDIR=${0%/*}

echo "Linking from $DOTDIR"
linkFiles

