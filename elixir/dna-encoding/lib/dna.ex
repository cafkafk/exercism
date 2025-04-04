defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?\s -> 0
      ?A -> 1
      ?C -> 2
      ?G -> 4
      ?T -> 8
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0 -> ?\s
      1 -> ?A
      2 -> ?C
      4 -> ?G
      8 -> ?T
    end

    # Please implement the decode_nucleotide/1 function
  end

  def do_encode([], bitstring), do: bitstring

  def do_encode([head | tail], bitstring) do
    do_encode(tail, <<bitstring::bitstring, encode_nucleotide(head)::size(4)>>)
  end

  def encode(dna) do
    do_encode(dna, <<>>)
  end

  def do_decode(<<>>, charlist), do: charlist

  def do_decode(<<head::4, tail::bitstring>>, charlist) do
    do_decode(tail, charlist ++ [decode_nucleotide(head)])
  end

  def decode(dna) do
    do_decode(dna, '')
  end
end
