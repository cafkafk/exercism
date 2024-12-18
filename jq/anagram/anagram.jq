(.subject|ascii_downcase) as $s
| .candidates
| map({s: ., n: .|ascii_downcase|explode|add})
| map(
    # Ensures strings have the same letters
    select((.s|ascii_downcase/""|sort) == ($s/""|sort))
    # Ensure the input string isn't output (anagrams aren't reflexive)
  | select((.s|ascii_downcase) != $s)
    # Ensures strings have the same ascii sum
  | select(.n == ($s|explode|add))
  .s
  )
