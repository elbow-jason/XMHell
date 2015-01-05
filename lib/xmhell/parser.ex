defmodule Xmhell.Parser do

  @opening ~r/(<([-:\w]+)(((\s+)[\w]+)*(=(""|"[-:\w]+"))*)*>)/
  @closing ~r{<\/\s*[\w-]+\s*>}
  @self_closing ~r/(<([-:\w]+)(((\s+)[\w]+)*(=(""|"[-:\w]+"))*)*\/>)/

  def get_regexes do
    %{
      opening: @opening,
      closing: @closing,
      self_closing: @self_closing
    }
  end

  def process(xml) do
    process(xml, [])
  end 

  def process(xml, list) do
    xml
      |> clean_whitespace
      |> get_opening_tag
      |> remove_the_tag(xml)
      |> remove_closing_tag
  end

  def clean_whitespace(string) do
    string |> String.rstrip |> String.lstrip
  end


  @doc """
  Gets opening tag of an xml string. The opening tag 
  regex is #{inspect @opening}
  """
  def get_opening_tag(xml) do
    Regex.scan(@opening, xml) |> hd |> hd
  end

  def get_closing_tag(xml) do
    Regex.scan(@closing, xml) |> tl |> hd
  end

  def remove_the_tag(tag, xml) do
    String.split_at(xml, String.length(tag))
  end

  def slice_from_end_of(closing_tag, xml) do
    new_length = String.length(xml) - String.length(closing_tag)
    String.slice(xml, 0..new_length)
  end

  def remove_closing_tag(xml) do
    xml
      |> get_closing_tag
      |> slice_from_end_of(xml)
  end


end