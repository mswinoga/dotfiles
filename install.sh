#!/bin/sh

function installFonts {
  CWD=$(pwd)
  TMPDIR=$(mktemp -d)
  git clone https://github.com/powerline/fonts $TMPDIR
  if [ -d $TMPDIR ]; then
    cd $TMPDIR
    exec ./install.sh
    cd $CWD
    rm -rf $TMPDIR
  fi
}

function linkFiles {
  for FILE in $DOTDIR/*; do
    DOTFILE=$HOME/.${FILE##*/}
    if [ $FILE != $0 ]; then
      if [ -e $DOTFILE ]; then
#        mv $DOTFILE ${DOTFILE}.dotbak
        echo "mv $DOTFILE ${DOTFILE}.dotbak"
      fi
#      ln -s $FILE $DOTFILE
      echo "ln -s $FILE $DOTFILE"
    fi
  done
}

DOTDIR=${0%/*}

echo "Linking from $DOTDIR"
linkFiles
#installFonts

