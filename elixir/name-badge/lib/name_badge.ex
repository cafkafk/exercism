defmodule NameBadge do
  def print(nil, name, nil), do: "#{name} - OWNER"
  def print(nil, name, department), do: "#{name} - #{department |> String.upcase()}"
  def print(id, name, nil), do: "[#{id}] - #{name} - OWNER"
  def print(id, name, department), do: "[#{id}] - #{name} - #{department |> String.upcase()}"
end
