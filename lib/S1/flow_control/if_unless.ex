defmodule S1.FlowControl.IfUnless do
  def output do
    text = IO.gets("Type something: ")

    if(is_bitstring("Hey")) do IO.puts :ok end

    unless(is_bitstring(3456)) do IO.puts :not_string end
  end

end