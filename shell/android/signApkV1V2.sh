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

source `dirname $0`/common.sh

echo "align apk"
zipaligncmd=`android_cmd zipalign`
unaligned=${file}unaligned
mv $file $unaligned && $zipaligncmd -v -p 4 $unaligned $file && rm $unaligned

apksignercmd=`android_cmd apksigner`
echo "apksigner signning apk"
$apksignercmd sign --ks $storeFile --ks-pass pass:$storePass \
  --ks-key-alias $keyAlias -key-pass pass:$keyPass \
  --v1-signing-enabled true \
  --v2-signing-enabled true \
  $file

