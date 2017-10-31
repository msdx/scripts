#!/bin/bash

android_cmd() {
  if type $1 2>/dev/null 1>&2; then
    echo $1
  else
    echo `find ${ANDROID_HOME}/build-tools -name $1 |tail -n 1`
  fi
}

