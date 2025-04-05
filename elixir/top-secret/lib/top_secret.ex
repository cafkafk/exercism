defmodule TopSecret do
  def to_ast(string), do: Code.string_to_quoted(string) |> elem(1)

  defp name_and_args([{:when, _, args} | _]), do: name_and_args(args)
  defp name_and_args([{name, _, args} | _]) when is_list(args), do: {name, args}
  defp name_and_args([{name, _, args} | _]) when is_atom(args), do: {name, []}

  def decode_secret_message_part({op, _, args} = ast, acc) when op in [:def, :defp] do
    {name, args} = name_and_args(args)
    {ast, [name |> to_string() |> String.slice(0, length(args)) | acc]}
  end

  def decode_secret_message_part(ast, acc), do: {ast, acc}

  def decode_secret_message(string) do
    ast = to_ast(string)
    {_, acc} = Macro.prewalk(ast, [], &decode_secret_message_part/2)

    acc |> Enum.reverse() |> Enum.join("")
  end
end
