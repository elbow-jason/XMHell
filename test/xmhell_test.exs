defmodule XmhellTest do
  use ExUnit.Case

  def sample_xml do
    """
    <outtermost tag="true">
      <first>I am first</first>
      <div class="col-lg-6>
        <nester>
          <nested> info 1 </nested>
          <nested> info 2 </nested>
          <nested order="Last"> info 3 </nested>
        </nester>
      </div>
      <third @value="12345"></third>
    </outtermost>
    """
  end


  test "sample is returned as a list of tuples" do
    result = Xmlhell.parse(sample_xml)
    assert is_list(result)
    assert result |> hd |> is_tuple
  end
end
