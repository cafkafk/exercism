def valid:
  (.|gsub("\\D"; "")) as $digits |

  if   .|ascii_downcase|test("[a-z]")
    then "letters not permitted" | halt_error
  elif .|gsub("[\\(\\)-\\.]"; "")|test("\\p{P}")
    then "punctuations not permitted" | halt_error
  elif $digits|length < 10
    then "must not be fewer than 10 digits"   | halt_error
  elif $digits|length > 11
    then "must not be greater than 11 digits" | halt_error
  elif ($digits|length == 10) and ($digits/""|.[0] == "0")
    then "area code cannot start with zero" | halt_error
  elif ($digits|length == 10) and ($digits/""|.[0] == "1")
    then "area code cannot start with one" | halt_error
  elif ($digits|length == 10) and ($digits/""|.[3] == "0")
    then "exchange code cannot start with zero" | halt_error
  elif ($digits|length == 10) and ($digits/""|.[3] == "1")
    then "exchange code cannot start with one" | halt_error
  elif ($digits|length == 11) and ($digits/""|.[1] == "0")
    then "area code cannot start with zero" | halt_error
  elif ($digits|length == 11) and ($digits/""|.[1] == "1")
    then "area code cannot start with one" | halt_error
  elif ($digits|length == 11) and ($digits/""|.[4] == "0")
    then "exchange code cannot start with zero" | halt_error
  elif ($digits|length == 11) and ($digits/""|.[4] == "1")
    then "exchange code cannot start with one" | halt_error
  elif ($digits|length == 11) and (.|test("^(\\+)?1")|not)
    then "11 digits must start with 1" | halt_error
  elif ($digits|length == 11) and (.|test("^(\\+)?1"))
    then $digits[1:]
  else $digits
  end;

.phrase|valid
