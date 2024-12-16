# Take any positive integer n.
# If n is even, divide n by 2 to get n / 2.
# If n is odd, multiply n by 3 and add 1 to get 3n + 1.
# Repeat the process indefinitely.
def collatz:
  if   .[1]     == 1 then  .[0]
  elif .[1] % 2 == 0 then [.[0]+1, .[1] / 2     ] | collatz
  else                    [.[0]+1, .[1] * 3 + 1 ] | collatz
  end;

def steps:
  if . <= 0 then "Only positive integers are allowed" | halt_error
  elif . > 0 then [0, .] | collatz
  end;
