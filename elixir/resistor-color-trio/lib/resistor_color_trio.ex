defmodule ResistorColorTrio do
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

  @units %{
    ohms: 1,
    kiloohms: 10 ** 3,
    megaohms: 10 ** 6,
    gigaohms: 10 ** 9
  }

  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label([a, b, c | _rest]) do
    digits = Integer.undigits([decode(a), decode(b) | zeros(c)])
    unit = unit(digits)
    digits = shorten(digits, unit)

    {digits, unit}
  end

  defp decode(color), do: Map.get(@colors, color)

  defp zeros(color), do: List.duplicate(0, decode(color))

  defp unit(r) when r >= @units.gigaohms, do: :gigaohms
  defp unit(r) when r >= @units.megaohms, do: :megaohms
  defp unit(r) when r >= @units.kiloohms, do: :kiloohms
  defp unit(r), do: :ohms

  defp shorten(n, unit) do
    (n / @units[unit]) |> round()
  end
end
