#"number": 2000000000

[.number | while(. > 0; . / 2 | floor) | . % 2] | add // 0
