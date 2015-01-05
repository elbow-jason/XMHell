defmodule Xmhell do
  @moduledoc """
  An xml parser that returns data in a simple format that makes sense instead
  of crazy data that makes no sense.
  """

  def parse(xml_string) when xml_string |> is_binary do
    Xmhell.Parser.process(xml_string)
  end

  def parse(xml_chars) when xml_chars |> is_list do
    xml_chars
      |> String.to_string
      |> parse
  end

end
