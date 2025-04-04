defmodule NeedForSpeed.RemoteControlCar do
  alias NeedForSpeed.RemoteControlCar, as: Car

  defstruct [
    :nickname,
    :color,
    battery_percentage: 100,
    distance_driven_in_meters: 0
  ]

  def new(color, nickname) when color in [:red, :blue, :green] do
    %Car{nickname: nickname, color: color}
  end

  def display_distance(%Car{distance_driven_in_meters: d}) do
    "#{d} meters"
  end

  def display_battery(%Car{battery_percentage: 0}) do
    "Battery empty"
  end

  def display_battery(%Car{battery_percentage: b}) do
    "Battery at #{b}%"
  end
end
