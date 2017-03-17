defmodule ElixirBase.Supervisor do
  require Logger

  @moduledoc """
    Main app supervisor
  """

  use Supervisor

  def start_link,
    do: Supervisor.start_link(__MODULE__, :ok, name: ElixirBase.Supervisor)

  @spec init(:ok) ::
    {:ok, {:supervisor.sup_flags, [Supervisor.Spec.spec]}}
  def init(:ok) do
    _ = Logger.info("Start Elixir Base supervisor")
    children = []
    supervise(children, strategy: :one_for_one)
  end
end
