#!/bin/bash
function echoHelp() {
  echo "Usage: $0 <unsignedFile> <storeFile> <storePassword> <keyAlias> <keyPassword>"
}
if [[ ! -n $1 ]]; then
  echoHelp
  exit 0 
fi
file=$1
storeFile=$2
storePass=$3
keyAlias=$4
keyPass=$5

jarsigner -verbose -keystore $storeFile -storepass $storePass $file $keyAlias -keypass $keyPass

rtn=$?
if [[ ! $rtn -eq 0 ]]; then
  echoHelp
  exit $rtn
fi

unaligned=${file}unaligned
mv $file $unaligned

zipalign -f -v 4 $unaligned $file
rm $unaligned 
