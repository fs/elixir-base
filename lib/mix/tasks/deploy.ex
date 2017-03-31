defmodule Mix.Tasks.Deploy do
  require Logger

  use Mix.Task
  alias Mix.Shell

  @moduledoc """
  Deploys project using EDeliver. Accepts target environment as an argument.
  """

  @spec run(any()) :: any()
  @doc """
  Deploys to `production` env from `production` branch
  """
  def run(["production"|_]), do: deploy("production", "production")
  @doc """
  Default: deploys to `staging` env from `master` branch
  """
  def run(_), do: deploy("staging", "master")

  defp deploy(dest, branch) do
    _ = Logger.info("Deploying #{dest} to #{branch}")

    dest |> build(branch) |> release(dest) |> start(dest)
  end

  defp build(dest, branch), do: execute("mix edeliver build release #{dest} --branch=#{branch} --verbose")

  defp release(0, dest), do: execute("mix edeliver deploy release #{dest} --verbose")
  defp release(prev_status, _), do: prev_status

  defp start(0, dest), do: execute("mix edeliver start #{dest} --verbose")
  defp start(prev_status, _), do: prev_status

  defp execute(command), do: command |> Shell.cmd(&IO.write/1)
end
