path="$1"
if [ -z "$1" ]; then
    path="packages"
fi
if [ ! -d "$path" ]; then
  mkdir "$path"
fi
stanza *.stanza -pkg "$path"
