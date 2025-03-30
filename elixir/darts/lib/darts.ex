defmodule Darts do
  @type position :: {number, number}

  defp hypot(x, y), do: :math.sqrt(x * x + y * y)

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    cond do
      hypot(x, y) <= 1 -> 10
      hypot(x, y) <= 5 -> 5
      hypot(x, y) <= 10 -> 1
      hypot(x, y) > 10 -> 0
    end
  end
end
