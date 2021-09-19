syn match   apexError           "\""
syn match   apexConditional     "\<switch\s\+on\>"
syn match   apexOperator        "\(\.\)\@<!new\>"
syn match   apexEscapeChar      contained "\(\\n\|\\r\|\\t\)"
syn match   apexType            "Set\(\s*\)<"me=s+3
syn match   apexTypedef         "\.\s*\<class\>"ms=s+1
syn match   apexClassDecl       "^class\>"
syn match   apexClassDecl       "[^.]\s*\<class\>"ms=s+1
syn match   apexSharing         "\<\(inherited\|with\(out\)\?\)\>\s\+\<sharing\>"
syn match   apexAnnotation      "@\([_$a-zA-Z][_$a-zA-Z0-9]*\.\)*[_$a-zA-Z][_$a-zA-Z0-9]*\>"
syn match   apexClassDecl       "@interface\>"
syn match   apexDecorator       /^\s*@[a-zA-Z]*./ 
syn match   apexBraces          "[{}]"
syn match   apexKeyword         "[<>]"
syn match   apexKeyword         "=>"
syn region  apexString          start=+'+ end=+'+ skip=+\(\\\\\|\\'\)+ contains=apexEscapeChar
syn match   apexSoqlStatement   contained "for\s\+update"
syn match   apexSoqlStatement   contained "with\s\+data\s\+category"
syn match   apexSoqlVariable    contained ":.[a-zA-Z\._]\+" contains=apexObject, apexConstant
syn match   apexSoqlSymbols     contained "[,()\[\]]"
syn region  apexSoql            start=+\[+ end=+]+ contains=apexSoqlStatement, apexString, apexNumber, apexSoqlSymbols, apexSoqlVariable,apexBrackets keepend

syn case match
syn match   apexObject          '\v<\$*\u%(\w|\$)*>' display
syn match   apexConstant        /\<\u[A-Z0-9_]\+\>/ display
syn match   apexIdentifier      /\<\l[A-Z0-9_]\+\>/ display

syn case    ignore
syn region  apexComment         start="/\*" end="\*/" contains=apexTodo
syn match   apexComment         "//.*" contains=apexTodo
syn match   apexComment         "/\*\*/"
syn match   apexNumber          "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
syn match   apexNumber          "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
syn match   apexNumber          "\<\d\+[eE][-+]\=\d\+[fFdD]\=\>"
syn match   apexNumber          "\<\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"
syn match   apexFunction        "\v<%(\h|\$)%(\w|\$)*>\ze\_s*\(\_.{-}\)"
