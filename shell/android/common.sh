#!/bin/bash

android_cmd() {
  if type $1 1>&2 2>/dev/null; then
    return $1
  else
    return `find ${ANDROID_HOME}/build-tools -name $1 |tail -n 1`
  fi
}

