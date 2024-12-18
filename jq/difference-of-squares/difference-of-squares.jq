([range(1;.input.number+1)]) as $n
| if .property == "squareOfSum"
  then pow(($n|add);2)
elif .property == "sumOfSquares"
  then $n|map(pow(.; 2))|add
elif .property == "differenceOfSquares"
  then pow(($n|add);2) - ($n|map(pow(.; 2))|add)
end
