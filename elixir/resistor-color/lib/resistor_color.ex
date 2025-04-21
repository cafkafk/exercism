defmodule ResistorColor do
  @doc """
  Return the value of a color band
  - white: 9
  """

  @colors %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @spec code(atom) :: integer()
  def code(color) do
    Map.get(@colors, color)
  end
end
