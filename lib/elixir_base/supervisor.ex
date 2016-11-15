defmodule ElixirBase.Supervisor do
  require Logger

  @moduledoc """
    Main app supervisor
  """

  use Supervisor

  def start_link,
    do: Supervisor.start_link(__MODULE__, :ok, name: ElixirBase.Supervisor)

  def init(:ok) do
    Logger.info("Start Elixir Base supervisor")
    children = []
    supervise(children, strategy: :one_for_one)
  end
end
