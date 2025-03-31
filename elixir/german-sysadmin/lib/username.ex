defmodule Username do
  def sanitize([]), do: []

  def sanitize([h | t]) do
    case h do
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ü -> 'ue'
      ?ß -> 'ss'
      x when x >= ?a and x <= ?z -> [x]
      ?_ -> '_'
      _ -> ''
    end ++ sanitize(t)
  end
end
