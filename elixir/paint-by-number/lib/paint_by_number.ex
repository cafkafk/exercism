defmodule PaintByNumber do
  def palette_bit_size(color_count), do: :math.log2(color_count) |> ceil

  def empty_picture(), do: <<>>

  def test_picture(), do: <<0::2, 1::2, 2::2, 3::2>>

  def prepend_pixel(picture, color_count, pixel_color_index) do
    palette_bit_size = palette_bit_size(color_count)
    <<pixel_color_index::size(palette_bit_size), picture::bitstring>>
  end

  def get_first_pixel(picture, color_count) do
    palette_bit_size = palette_bit_size(color_count)

    case picture do
      <<first::size(palette_bit_size), _rest::bitstring>> -> first
      _ -> nil
    end
  end

  def drop_first_pixel(picture, color_count) do
    palette_bit_size = palette_bit_size(color_count)

    case picture do
      <<_first::size(palette_bit_size), rest::bitstring>> -> rest
      _ -> <<>>
    end
  end

  def concat_pictures(picture1, picture2), do: <<picture1::bitstring, picture2::bitstring>>
end
