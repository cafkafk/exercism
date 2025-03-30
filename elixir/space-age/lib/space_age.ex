# One Earth year equals 365.25 Earth days, or 31,557,600 seconds.  If you were
# told someone was 1,000,000,000 seconds old, their age would be 31.69
# Earth-years.
#
# | Planet  | Orbital period in Earth Years |
# | ------- | ----------------------------- |
# | Mercury | 0.2408467                     |
# | Venus   | 0.61519726                    |
# | Earth   | 1.0                           |
# | Mars    | 1.8808158                     |
# | Jupiter | 11.862615                     |
# | Saturn  | 29.447498                     |
# | Uranus  | 84.016846                     |
# | Neptune | 164.79132                     |
#
defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @mercury 0.2408467
  @venus 0.61519726
  @earth 1.0
  @mars 1.8808158
  @jupiter 11.862615
  @saturn 29.447498
  @uranus 84.016846
  @neptune 164.79132

  defp sec_to_yrs(seconds, ratio), do: seconds / (31_557_600 * ratio)

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(planet, seconds) do
    case planet do
      :mercury -> {:ok, sec_to_yrs(seconds, @mercury)}
      :venus -> {:ok, sec_to_yrs(seconds, @venus)}
      :earth -> {:ok, sec_to_yrs(seconds, @earth)}
      :mars -> {:ok, sec_to_yrs(seconds, @mars)}
      :jupiter -> {:ok, sec_to_yrs(seconds, @jupiter)}
      :saturn -> {:ok, sec_to_yrs(seconds, @saturn)}
      :uranus -> {:ok, sec_to_yrs(seconds, @uranus)}
      :neptune -> {:ok, sec_to_yrs(seconds, @neptune)}
      _ -> {:error, "not a planet"}
    end
  end
end
