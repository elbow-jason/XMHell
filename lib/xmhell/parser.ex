defmodule Xmhell.Parser do

  @opening ~r/<([\w-]+)(((\s+)[\w]+)*(=(""|"[-\w]+"))*)*>/
  @closing ~r{<\/\s*([\w-])+\s*>}

  def get_regexes do
    %{opening: @opening, closing: @closing}
  end

  def process(xml) do
    xml
      |> get_opening_tag
  end


  @doc """
  Extracts the opening tag of an html
  """
  def get_opening_tag(xml) do
    Regex.scan(@opening, xml) |> hd |> hd
  end

end