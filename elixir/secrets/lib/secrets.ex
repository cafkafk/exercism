defmodule Secrets do
  def secret_add(s), do: &(&1 + s)
  def secret_subtract(s), do: &(&1 - s)
  def secret_multiply(s), do: &(&1 * s)
  def secret_divide(s), do: &div(&1, s)
  def secret_and(s), do: &Bitwise.band(&1, s)
  def secret_xor(s), do: &Bitwise.bxor(&1, s)
  def secret_combine(fn1, fn2), do: &fn2.(fn1.(&1))
end
