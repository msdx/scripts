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

echo "align apk"
unaligned=${file}unaligned
mv $file $unaligned && zipalign -v -p 4 $unaligned $file && rm $unaligned

echo "apksigner signning apk"
apksigner sign --ks $storeFile --ks-pass pass:$storePass \
  --ks-key-alias $keyAlias -key-pass pass:$keyPass \
  --v1-signning-enabled true \
  --v2-signning-enabled true \
  $file

