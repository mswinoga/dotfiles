#!/bin/sh

function linkFiles() {
  for FILE in $DOTDIR/*; do
    if [ $FILE != $0 ]; then
      if [ -e $DOTFILE ]; then
        mv $DOTFILE ${DOTFILE}.dotbak
      fi
      DOTFILE=$HOME/.${FILE##*/}
      ln -s $FILE $DOTFILE
    fi
  done
}

DOTDIR=${0%/*}
echo "Linking from $DOTDIR"
linkFiles

