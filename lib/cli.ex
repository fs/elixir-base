defmodule ElixirBase.CLI do
  @moduledoc """
    CLI entry point
  """

  @spec main(any) :: {:od, pid}
  def main(args) do
    args
    |> parse_args
    |> process
  end

  defp parse_args(args) do
    parse = OptionParser.parse args,
      switches: [help: :boolean],
      aliases: [h: :help]

    case parse do
      {[help: true], _, _} -> :help
      _ -> :help
    end
  end

  defp process(:help) do
    IO.puts """
      usage: elixir-base <opts>
      provide custom options
    """
    ElixirBase.Supervisor.start_link
  end
end
