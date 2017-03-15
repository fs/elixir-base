defmodule Mix.Tasks.SetupHistory do
  use Mix.Task
  alias Mix.Shell

  @moduledoc false

  @spec run([String.t]) :: integer
  def run(_), do: "bin/setup_history" |> Shell.cmd(&IO.write/1)
end
