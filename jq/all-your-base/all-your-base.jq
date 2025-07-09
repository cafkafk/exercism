def changeBase:
  .
  | debug
  | .inputBase as $inputBase
  | .digits as $digits
  | .outputBase as $outputBase
  | $digits
  | to_entries
  | debug
  | map(
        .
        | debug
        | .value * pow($inputBase; .key)
        | debug
      )
  | debug
;

# Example Input: {"inputBase":2,"digits":[1],"outputBase":10}
.
| changeBase
