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

echo "Alignning ${file} with zipalign..."
unaligned=${file}unaligned
mv $file $unaligned && zipalign -v -p 4 $unaligned $file && rm $unaligned

echo "Signning ${file} with jarsigner..."
jarsigner -verbose -keystore $storeFile -storepass $storePass $file $keyAlias -keypass $keyPass

