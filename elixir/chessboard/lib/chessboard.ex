defmodule Chessboard do
  def rank_range, do: 1..8

  def file_range, do: ?A..?H

  def ranks, do: for(i <- rank_range(), do: i)

  def files, do: for(c <- file_range(), do: <<c>>)
end
