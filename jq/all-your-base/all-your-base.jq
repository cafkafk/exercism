def fromBase:
  def recurseBase($base):
    if . == 0 then
      []
    else
      (. % $base), (. / $base | floor | recurseBase($base))
    end;
  .
  | . as $input
  | .inputBase as $inputBase
  | .digits as $digits
  | .outputBase as $outputBase
  | $digits
  | to_entries
  | map(
        .
        | .value * pow($inputBase; .key)
      )
  | add
  | recurseBase($outputBase)
  | reverse
  | join("")
;


# Example Input: {"inputBase":2,"digits":[1],"outputBase":10}
.
| .inputBase as $inputBase
| if any(.digits[]; . < 0 or . >= $inputBase) then
    "all digits must satisfy 0 <= d < input base"
  else
    fromBase
  end
