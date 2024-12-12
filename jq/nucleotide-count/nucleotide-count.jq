.strand
  | reduce (.|ascii_upcase/"")[] as $n
  (
    {A: 0, C: 0, G: 0, T: 0};
    if .|has("\($n)")
    then .["\($n)"] += 1
    else "Invalid nucleotide in strand"|halt_error
    end
  )
