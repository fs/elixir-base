defmodule ElixirBase do
  require Logger

  @moduledoc """
    Entry point of library/application.
  """

  def start(_type \\ nil, _args \\ nil) do
    Logger.info("Start Elixir Base app")
    ElixirBase.Supervisor.start_link
  end
end
