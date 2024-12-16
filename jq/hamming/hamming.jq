  (.strand1/"") as $s1
| (.strand2/"") as $s2
| if ($s1|length) == ($s2|length) then [range(0;$s1|length)] | map(if $s1[.] == $s2[.] then 0 else 1 end)|add // 0
  else "strands must be of equal length"|halt_error end
