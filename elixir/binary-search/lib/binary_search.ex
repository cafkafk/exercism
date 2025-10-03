defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  defp search(numbers, key, low, high) do
    middle_index = div(low + high, 2)
    middle_element = elem(numbers, middle_index)

    cond do
      # Failure
      low > high -> :not_found
      # Success
      middle_element == key -> {:ok, middle_index}
      # Keep Looking
      middle_element > key -> search(numbers, key, low, middle_index - 1)
      middle_element < key -> search(numbers, key, middle_index + 1, high)
    end
  end

  def search({}, _key), do: :not_found
  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    search(numbers, key, 0, tuple_size(numbers) - 1)
  end
end
