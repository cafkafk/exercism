defmodule CollatzConjecture do
  # For Integer.is_even/1
  require Integer

  defp even(n), do: div(n, 2)
  defp odd(n), do: n * 3 + 1

  defp collatz(n, i) do
    cond do
      n == 1 -> i
      n <= 0 -> raise FunctionClauseError
      !is_number(n) -> raise FunctionClauseError
      Integer.is_even(n) -> collatz(even(n), i + 1)
      Integer.is_odd(n) -> collatz(odd(n), i + 1)
    end
  end

  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input), do: collatz(input, 0)
end
