defmodule BasketballWebsite do
  defp traverse_data([], data), do: data
  defp traverse_data([], nil), do: nil
  defp traverse_data([head | tail], data), do: traverse_data(tail, data[head])

  def extract_from_path(data, path), do: traverse_data(String.split(path, "."), data)

  def get_in_path(data, path), do: get_in(data, String.split(path, "."))
end
