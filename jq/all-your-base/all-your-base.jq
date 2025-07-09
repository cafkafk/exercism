def changeBase:
  .
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
  | [.]
;

# Example Input: {"inputBase":2,"digits":[1],"outputBase":10}
.
| debug
| changeBase
