defmodule Secrets do
  def secret_add(secret), do: fn n -> n + secret end

  def secret_subtract(secret), do: fn n -> n - secret end

  def secret_multiply(secret), do: fn n -> n * secret end

  def secret_divide(secret), do: fn n -> div(n, secret) end

  def secret_and(secret), do: fn n -> Bitwise.band(n, secret) end

  def secret_xor(secret), do: fn n -> Bitwise.bxor(n, secret) end

  def secret_combine(fn1, fn2), do: fn n -> fn2.(fn1.(n)) end
end
