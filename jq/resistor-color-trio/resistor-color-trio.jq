def pretty_number: if . < 1000 then . else (. / 1000 | pretty_number) end;

def unit: if . / 1e9 > 1 then "giga" elif . / 1e6 > 1 then "mega" elif . / 1e3 > 1 then "kilo" else "" end + "ohms";

{
  black: 0,
  brown: 1,
  red: 2,
  orange: 3,
  yellow: 4,
  green: 5,
  blue: 6,
  violet: 7,
  grey: 8,
  white: 9
} as $lookup |
.colors
  | map($lookup[.]) as $map
  | ($map[2]|tonumber|exp10) as $magnitude
  | ($map[0:2]|join("")|tonumber| . * $magnitude) as $raw_value
  |
  {
    value: $raw_value | pretty_number,
    unit: $raw_value |unit,
  }
