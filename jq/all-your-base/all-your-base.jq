# Helper function to convert a number to a list of digits in a given base.
# Input: a number.
# Output: an array of digits.
def to_digits($base):
  if . == 0 then
    [0]
  else
    def recurse:
      if . == 0 then
        empty
      else
        (. % $base), (. / $base | floor | recurse)
      end;
    [recurse] | reverse
  end;

# Main logic
.inputBase as $inputBase
| .outputBase as $outputBase
| .digits as $digits
| if $inputBase < 2 then
  "input base must be >= 2" | halt_error(1)
elif $outputBase < 2 then
  "output base must be >= 2" | halt_error(1)
elif any($digits[]; . < 0 or . >= $inputBase) then
  "all digits must satisfy 0 <= d < input base" | halt_error(1)
else
  # Convert from input base to a decimal number
  (
    ($digits | length) as $len
    | [
        $digits
        | to_entries
        | .[]
        | .value * pow($inputBase; $len - 1 - .key)
      ]
    | add // 0
  )
  # Convert the decimal number to the output base
  | to_digits($outputBase)
end
