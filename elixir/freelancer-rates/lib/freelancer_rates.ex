defmodule FreelancerRates do
  defp a(b, d), do: b - b * d / 100
  defp d(r), do: r * 8.0
  def daily_rate(r), do: d(r)
  def apply_discount(b, d), do: a(b, d)
  def monthly_rate(r, d), do: a(d(r) * 22, d) |> ceil
  def days_in_budget(b, r, d), do: (b / a(d(r), d)) |> Float.floor(1)
end
