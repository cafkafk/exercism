def fromBase:
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
  | {input: $input, result: .}
;

def toBase:
  .
  | . as $input
  | .inputBase as $inputBase
  | .digits as $digits
  | .outputBase as $outputBase
  | [.result];

# Example Input: {"inputBase":2,"digits":[1],"outputBase":10}
.
| debug
| fromBase
| toBase
