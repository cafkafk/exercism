def nail(start; prev; next):
  if start == null then []
  elif next|length == 0 then ["And all for the want of a \(start)."]
  else ["For want of a \(prev) the \(next[0]) was lost."] + (nail(start; next[0]; next[1:]))
  end;

.strings|nail(.[0]; .[0]; .[1:])
