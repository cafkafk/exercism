defmodule DancingDots.Dot do
  defstruct [:x, :y, :radius, :opacity]
  @type t :: %__MODULE__{}

  @type error :: String.t()
  @type opts :: collection :: any
  @type frame_number :: integer

  @callback init(opts) :: {:ok, opts} | {:error, error}
  @callback handle_frame(Dot, frame_number, opts) :: Dot

  defmacro __using__(_) do
    quote do
      @behavior Animation
      def init(opts), do: {:ok, opts}
      defoverridable count: 1
    end
  end
end
