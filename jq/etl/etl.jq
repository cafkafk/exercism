.legacy|to_entries|map((.key|tonumber) as $key|.value|map({"\(.|ascii_downcase)": $key}))|reduce (.[][]) as $i ({}; . + $i)
