defmodule RPNCalculator.Exception do
  # Please implement DivisionByZeroError here.
  defmodule DivisionByZeroError do
    defexception message: "division by zero occurred"
  end

  # Please implement StackUnderflowError here.
  defmodule StackUnderflowError do
    defexception message: "stack underflow occurred"

    @impl true
    def exception(value) do
      case value do
        [] ->
          %StackUnderflowError{}

        _ ->
          %StackUnderflowError{message: "stack underflow occurred, context: " <> value}
      end
    end
  end

  def divide([]), do: raise(StackUnderflowError, "when dividing")
  def divide([a]), do: raise(StackUnderflowError, "when dividing")
  def divide([0 | tail]), do: raise(DivisionByZeroError)
  def divide([a, b]), do: div(b, a)
end
