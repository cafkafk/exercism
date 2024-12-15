def luhn:
  if ("\(.)" / "" | map(select(test("\\d"))))|length <=1 then false
  elif .|test("^(\\d|\\s)+$")|not then false
  else
    (
      "\(.)" / ""
      | map(
          select(
            test("\\d")
          )
          | tonumber
        )
    ) as $s
    | [range(0; $s|length)]
    | map(
        if . % 2 == 0 then (($s[.]) * 2 |(
            if . > 9 then . - 9
            end
          ))
        else $s[.]
        end
      )
    | add
    | . % 10 == 0
  end;
.|luhn
