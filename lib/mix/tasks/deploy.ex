defmodule Mix.Tasks.Deploy do
  use Mix.Task

  def run(["production"]) do
    deploy("production", "production")
  end
  def run(_) do
    deploy("staging", "master")
  end

  defp deploy(dest, branch) do
    IO.puts("Deploying #{dest} to #{branch}")

    build(dest, branch) |> release(dest) |> start(dest)
  end

  defp build(dest, branch) do
    cmd("mix edeliver build release #{dest} --branch=#{branch} --verbose")
  end

  defp release(prev_status, dest) do
    if prev_status == 0 do
      cmd("mix edeliver deploy release #{dest} --verbose")
    else
      prev_status
    end
  end

  defp start(prev_status, dest) do
    if prev_status == 0 do
      cmd("mix edeliver start #{dest} --verbose")
    else
      prev_status
    end
  end

  defp log(output), do: IO.write(output)

  defp cmd(command) do
    Mix.Shell.cmd(command, &log/1)
  end
end
