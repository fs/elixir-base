defmodule Mix.Tasks.RunEspec do
  use Mix.Task
  alias Mix.Shell

  @moduledoc false

  @spec run([String.t]) :: integer
  def run(_), do: "MIX_ENV='test' mix espec --format=doc" |> Shell.cmd(&IO.write/1)
end
