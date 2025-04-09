defmodule DancingDots.Animation do
  @type dot :: DancingDots.Dot.t()
  @type opts :: keyword
  @type error :: any
  @type frame_number :: pos_integer

  @callback init(opts) :: {:ok, opts} | {:error, error}
  @callback handle_frame(dot, frame_number, opts) :: DancingDots.Dot.t()

  defmacro __using__(_) do
    quote do
      @behaviour DancingDots.Animation
      def init(opts), do: {:ok, opts}
      defoverridable init: 1
    end
  end
end

defmodule DancingDots.Flicker do
  import Integer, only: [mod: 2]
  use DancingDots.Animation

  @impl DancingDots.Animation
  def handle_frame(dot, frame_number, opts) do
    if mod(frame_number, 4) == 0 do
      %DancingDots.Dot{dot | opacity: dot.opacity * 0.5}
    else
      dot
    end
  end
end

defmodule DancingDots.Zoom do
  use DancingDots.Animation

  @impl DancingDots.Animation
  def init([velocity: velocity] = opts) when is_number(velocity) do
    {:ok, opts}
  end

  def init(opts) do
    velocity = Keyword.get(opts, :velocity)

    {:error,
     "The :velocity option is required, and its value must be a number. Got: #{inspect(velocity)}"}
  end

  @impl DancingDots.Animation
  def handle_frame(%{radius: radius} = dot, frame_number, [velocity: velocity] = opts) do
    %DancingDots.Dot{dot | radius: radius + (frame_number - 1) * velocity}
  end
end
