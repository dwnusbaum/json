# json
JSON parser and converter for the [Stanza](http://lbstanza.org) programming language.

## Installation

```sh
git clone https://github.com/dwnusbaum/json.git <path>
<path>/compile.sh <desired-package-path>
```

## Overview

To use the library, add `import json` to your stanza imports. When compiling your code, use `stanza <infiles> -o <outfile> -pkg-path <desired-package-path>`

**Example**

```stanza
defpackage test-package:
    import core
    import collections
    import json

    val json-string:String = "{\"name\":\"test\"}"

    val parsed-value = from-json(json-string)

    match(parsed-value):
        (object:HashTable<String,?>):
            for entry in object do:
                println $ entry
        (error):
            println $ error
```

**Library Functions**

* `from-json (:String) -> HashTable<String,?>|Vector<?>|Int|Double|String|False|True|None`: Parses a JSON string into a stanza value.
* `from-json-file (filename:String) -> HashTable<String,?>|Vector<?>|Int|Double|String|False|True|None`: Parses a JSON file into a stanza value. Loads the whole file into memory at once.
* `to-json (stanza-value) -> String`: Turns a stanza value into a json string, without newlines or spaces.
* `to-json (stanza-value, pretty:False|True) -> String`: Turns a stanza value into a json string, with newlines and 4 space indentation if `pretty` is true.
* `to-json (stanza-value, pretty:False|True, indent-size:Int) -> String`: Turns a stanza value into a json string, with newlines and `indent-size` space indentation if `pretty` is true.

**Known Limitations**
* Currently, incremental file parsing is not supported. To add it, the FileInputStream type would need to be augmented to include a peek? function, like the StringInputStream type.
* Stanza does not seem to support unicode yet, so all unicode characters will be truncated to single byte ASCII characters.
