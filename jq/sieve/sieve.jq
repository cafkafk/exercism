def sieve:
  .[0] as $n|
  if .|length <= 0 then .
  elif $n <= 1 then (. - [$n] | sieve)
  else
    [$n] + (
      map(
          select(. % $n != 0)
      )
      |sieve
    )
  end;

[range(0,.limit+1)]|sieve
