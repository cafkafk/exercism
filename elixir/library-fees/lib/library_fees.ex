defmodule LibraryFees do
  require NaiveDateTime
  def datetime_from_string(string), do: NaiveDateTime.from_iso8601!(string)

  def before_noon?(datetime), do: datetime.hour < 12

  def return_date(checkout_datetime) do
    if before_noon?(checkout_datetime) do
      Date.add(checkout_datetime, 28)
    else
      Date.add(checkout_datetime, 29)
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_datetime |> Date.diff(planned_return_date) |> max(0)
  end

  def monday?(datetime), do: Date.day_of_week(datetime) == 1

  def calculate_late_fee(checkout, return, rate) do
    checkout_datetime = datetime_from_string(checkout)
    return_datetime = datetime_from_string(return)

    return_date = return_date(checkout_datetime)

    if monday?(return_datetime) do
      (days_late(return_date, return_datetime) * rate * 0.5) |> floor
    else
      days_late(return_date, return_datetime) * rate
    end
  end
end
