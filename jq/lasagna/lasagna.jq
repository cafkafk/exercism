40 as $expected |
($expected - (.actual_minutes_in_oven // 0)) as $remain |
((.number_of_layers // 1) * 2) as $prep |
{
  expected_minutes_in_oven: $expected,
  remaining_minutes_in_oven: $remain,
  preparation_time: $prep,
  total_time: ($prep + ($expected - $remain))
}
