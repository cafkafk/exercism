def toRna:
  if   . == "" then .
  elif . == "C" then "G"
  elif . == "G" then "C"
  elif . == "T" then "A"
  elif . == "A" then "U"
  else (./""|.[0]|toRna) + (.[1:]|toRna)
  end;
