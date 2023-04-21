defmodule AM2.StringUtils do

  def colorize(string, escape) do
    [escape, string, :reset]
      |> IO.ANSI.format_fragment(true)
      |> IO.iodata_to_binary()
  end

  def print_warning(text) do
    colorize(text, :yellow) |> IO.puts()
  end

  def print_info(text) do
    colorize(text, :green) |> IO.puts()
  end

  def print_error(text) do
    colorize(text, :red) |> IO.puts()
  end

end
