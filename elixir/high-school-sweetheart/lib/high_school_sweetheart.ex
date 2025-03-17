defmodule HighSchoolSweetheart do
  def first_letter(name), do: name |> String.trim() |> String.slice(0, 1)

  def initial(name), do: first_letter(name) |> String.upcase() |> Kernel.<>(".")

  def initials(full_name),
    do: for(i <- full_name |> String.split(), do: i |> initial) |> Enum.join(" ")

  def pair(full_name1, full_name2) do
    """
    ❤-------------------❤
    |  #{full_name1 |> initials}  +  #{full_name2 |> initials}  |
    ❤-------------------❤
    """
  end
end
