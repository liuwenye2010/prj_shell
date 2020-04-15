
#https://www.tutorialspoint.com/powershell/powershell_regex.htm
#Format value
#Matches exact characters anywhere in the original value.
"book" -match "oo"

#Format   .
#Logic    Matches any single character.
"copy" -match "c..y"

#Format   [value]
#Logic    Matches at least one of the characters in the brackets.
"big" -match "b[iou]g"

#Format   [range]
#Logic    Matches at least one of the characters within the range. The use
#         of a hyphen (-) allows you to specify an adjacent character.
"and" -match "[a-e]nd"

#Format   [^]
#Logic    Matches any characters except those in brackets.
"and" -match "[^brt]nd"

#Format   ^
#Logic    Matches the beginning characters.
"book" -match "^bo"

#Format   $
#Logic    Matches the end characters.
"book" -match "ok$"

#Format   *
#Logic    Matches any instances of the preceding character.
"baggy" -match "g*"

#Format   ?
#Logic    Matches zero or one instance of the preceding character.
"baggy" -match "g?"

##Format:  \p{name}
#Logic:   Matches any character in the named character class specified by
#         {name}. Supported names are Unicode groups and block ranges such
#         as Ll, Nd, Z, IsGreek, and IsBoxDrawing.
 "abcd defg" -match "\p{Ll}+"

#Format:  \P{name}
#Logic:   Matches text not included in the groups and block ranges specified
#         in {name}.
 1234 -match "\P{Ll}+"

#Format:  \w
#Logic:   Matches any word character. Equivalent to the Unicode character
#         categories [\p{Ll}\p{Lu}\p{Lt}\p{Lo}\p{Nd}\p{Pc}]. If ECMAScript-
#         compliant behavior is specified with the ECMAScript option, \w is
#         equivalent to [a-zA-Z_0-9].
 "abcd defg" -match "\w+" #(this matches abcd)

#Format:  \W
#Logic:   Matches any nonword character. Equivalent to the Unicode categories
#         [^\p{Ll}\p{Lu}\p{Lt}\p{Lo}\p{Nd}\p{Pc}].
 "abcd defg" -match "\W+" #(this matches the space)

#Format:  \s
#Logic:   Matches any white-space character. Equivalent to the Unicode
#         character categories [\f\n\r\t\v\x85\p{Z}].
 "abcd defg" -match "\s+"

#Format:  \S
#Logic:   Matches any non-white-space character. Equivalent to the Unicode
#         character categories [^\f\n\r\t\v\x85\p{Z}].
 "abcd defg" -match "\S+"

#Format:  \d
#Logic:   Matches any decimal digit. Equivalent to \p{Nd} for Unicode and
#         [0-9] for non-Unicode behavior.
 12345 -match "\d+"

#Format:  \D
#Logic:   Matches any nondigit. Equivalent to \P{Nd} for Unicode and [^0-9]
#         for non-Unicode behavior.
 "abcd" -match "\D+"
 
 
 Format:  *
#Logic    Specifies zero or more matches; for example, \wor (abc). Equivalent
#         to {0,}.
 "abc" -match "\w*"

#Format:  +
#Logic:   Matches repeating instances of the preceding characters.
 "xyxyxy" -match "xy+"

#Format:  ?
#Logic:   Specifies zero or one matches; for example, \w? or (abc)?.
#         Equivalent to {0,1}.
 "abc" -match "\w?"

#Format:  {n}
#Logic:   Specifies exactly n matches; for example, (pizza){2}.
 "abc" -match "\w{2}"

#Format:  {n,}
#Logic:   Specifies at least n matches; for example, (abc){2,}.
 "abc" -match "\w{2,}"

#Format:  {n,m}
#Logic:   Specifies at least n, but no more than m, matches.
 "abc" -match "\w{2,3}"