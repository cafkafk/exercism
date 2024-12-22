{
  G: "grass",
  C: "clover",
  R: "radishes",
  V: "violets",
} as $seeds
| {
  Alice: [range(0;2)],
  Bob: [range(2;4)],
  Charlie: [range(4;6)],
  David: [range(6;8)],
  Eve: [range(8;10)],
  Fred: [range(10;12)],
  Ginny: [range(12;14)],
  Harriet: [range(14;16)],
  Ileana: [range(16;18)],
  Joseph: [range(18;20)],
  Kincaid: [range(20;22)],
  Larry: [range(22;24)],
} as $children
| (.diagram/"\n"|[(.[0]/""), (.[1]/"")]) as $r
| $children[.student] as $i
| [$r[0][$i[0]],$r[0][$i[1]],$r[1][$i[0]],$r[1][$i[1]]]
| map($seeds[.])
