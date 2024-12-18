def primefactors:
  if .value <= 1 then empty
  elif .value < .factor * .factor then .value
  elif .value % .factor > 0 then .factor += 1 | primefactors
  else .factor, ((.value = .value / .factor) | primefactors)
  end;

[ .factor = 2 | primefactors ]
