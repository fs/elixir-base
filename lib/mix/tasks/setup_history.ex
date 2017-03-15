defmodule Mix.Tasks.SetupHistory do
  use Mix.Task

  def run(_) do
    Mix.Shell.cmd("MIX_ENV='test' mix espec --format=doc", fn(output) -> IO.write(output) end)
  end
end
