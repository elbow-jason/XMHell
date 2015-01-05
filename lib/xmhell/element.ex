defmodule Element do
  defstruct tag: "", attrs: [], value: []

  def get_tag(%Element{tag: tag}), do: tag
  def get_attrs(%Element{attrs: attrs}), do: attrs


end