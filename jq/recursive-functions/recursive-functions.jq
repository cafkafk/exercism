# Add the elements of the input array, and return the sum.
#
# Example:
#   [1, 2, 3] | array_add           # => 6

def array_add:
  if .|length == 0 then
    0
  elif .|length == 1 then
    .[0]
  else
    .[0] + (.[1:]|array_add)
  end
  ;

# Reverse the input array, and return the result in a new array.
#
# Example:
#   [1, 2, 3] | array_reverse       # => [3, 2, 1]

def array_reverse:
  if .|length == 0 then
    []
  elif .|length == 1 then
    [.[0]]
  else
    [.[-1]] + (.[:-1]|array_reverse)
  end
  ;

# Run the filter `f` for each element of the input array,
# and return the outputs in a new array.
#
# Example:
#   [1, 2, 3] | array_map(. + 1)    # => [2, 3, 4]

def array_map(f):
  if .|length == 0 then
    []
  elif .|length == 1 then
    [.[0]|f]
  else
    [(.[0]|f)] + (.[1:]|array_map(f))
  end
  ;
