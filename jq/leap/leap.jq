#- In every year that is evenly divisible by 4.
#- Unless the year is evenly divisible by 100, in which case it's only a leap year if the year is also evenly divisible by 400.
.year|tonumber|
if   . % 100 == 0 and . % 400 == 0 then true
elif . % 100 != 0 and . % 4   == 0 then true
else                                   false
end
