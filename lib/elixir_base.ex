defmodule ElixirBase do
  require Logger

  @moduledoc """
    Entry point of library/application.
  """

  def start(_type, _args) do
    Logger.info "Start Elixir Base app"
    System.halt(0)
  end
end
