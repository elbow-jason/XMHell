defmodule Xmhell.Parser do

  @opening ~r/\A(<([-:\w]+)(((\s+)[\w]+)*(=(""|"[-:\w]+"))*)*>)/
  @closing ~r{\A<\/\s*[\w-]+\s*>}
  @self_closing ~r/\A(<([-:\w]+)(((\s+)[\w]+)*(=(""|"[-:\w]+"))*)*\/>)/

  def get_regexes do
    %{
      opening: @opening,
      closing: @closing,
      self_closing: @self_closing
    }
  end

  def process(xml), do: process(xml, [])
  def process("",  parsed), do: parsed
  def process(xml, parsed) do
    {entity_type, next_entity} = parse_next_entity(xml)
    new_xml = remove_tag(xml, next_entity)
    process(new_xml, parsed ++ [{entity_type, next_entity}])
  end

  def remove_tag(xml, next_entity) do
    next_entity <> rest = xml
  end

  def parse_next_entity(xml) do
    xml
      |> clean_whitespace
      |> get_next_group
  end

  def get_next_group(xml) do
    cond do
      Regex.match?(@opening, xml) -> {:open, get_tag(@opening, xml) }
      Regex.match?(@closing, xml) -> {:close, get_tag(@opening, xml) }
      Regex.match?(@self_closing, xml) -> {:open, get_tag(@opening, xml) }
    end
  end

  def get_tag(regex, xml) do
    Regex.scan(regex, xml) |> hd |> hd
  end

  def clean_whitespace(string) do
    string |> String.rstrip |> String.lstrip
  end

  def remove_the_tag(tag, xml) do
    String.split_at(xml, String.length(tag))
  end

end