if [ -z "$1" ]; then
    stanza *.stanza -pkg packages/
else
    stanza *.stanza -pkg "$1"
fi
