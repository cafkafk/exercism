.phrase
| gsub("-"; " ")
| gsub("\\p{P}"; "")
| ascii_upcase / " "
| map(./""|.[0])
| join("")
