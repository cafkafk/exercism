.["heyBob"]|
if .|test("lbalbslb") then "Fine. Be that way!"
elif .|test("^[A-Z\\d\\s\\p{P}]+\\?$") then "Calm down, I know what I'm doing!"
elif .|test("^([A-Za-z]+[\\d\\s\\p{P}]*)*\\?$") then "Sure."
elif .|test("^[A-Z\\d\\s\\p{P}]+$") then "Whoa, chill out!"
else
  "Whatever."
end
