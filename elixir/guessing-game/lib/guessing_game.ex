defmodule GuessingGame do
  def compare(_), do: "Make a guess"
  def compare(_, :no_guess), do: "Make a guess"
  def compare(n, n), do: "Correct"
  def compare(n, m) when abs(n - m) == 1, do: "So close"
  def compare(n, m) when n > m, do: "Too low"
  def compare(n, m) when n < m, do: "Too high"
end
