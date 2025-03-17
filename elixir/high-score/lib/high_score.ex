defmodule HighScore do
  @default_score 0
  def new(), do: %{}

  def add_player(scores, name, score \\ @default_score), do: scores |> Map.put(name, score)

  def remove_player(scores, name), do: scores |> Map.drop([name])

  def reset_score(scores, name), do: add_player(scores, name, @default_score)

  def update_score(scores, name, score),
    do: Map.update(scores, name, score, fn value -> value + score end)

  def get_players(scores), do: Map.keys(scores)
end
