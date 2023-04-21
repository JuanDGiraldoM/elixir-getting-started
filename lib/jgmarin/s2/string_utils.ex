defmodule S2.StringUtils do

  defp colorize(escape, string) do
    [escape, string, :reset]
      |> IO.ANSI.format_fragment(true)
      |> IO.iodata_to_binary()
  end

  def print_warning(text) do
    colorize(:yellow, text) |> IO.puts()
  end

  def print_info(text) do
    colorize(:green, text) |> IO.puts()
  end

  def print_error(text) do
    colorize(:red, text) |> IO.puts()
  end

end
