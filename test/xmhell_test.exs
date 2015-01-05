defmodule XmhellTest do
  use ExUnit.Case

  def simple do
    """
    <div class="giant">
      <h1> Yea </h1>
    </div>
    """
  end

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

  test "get_opening_tag returns the opening tag" do
    expected = "<div class=\"giant\">"
    assert Xmhell.Parser.get_opening_tag(simple) == expected
  end

  test "test opening regex matches" do
    %{opening: reg} = Xmhell.Parser.get_regexes
    assert Regex.match?(reg, "<div> </div>") == true
    assert Regex.match?(reg, "<div class=\"\"> </div>") == true
    assert Regex.match?(reg, "<div class=\"col-lg-6\"> </div>") == true
    assert Regex.match?(reg, "<div class=\"col-lg-6\" id=\"aseasd\"> </div>") == true
    assert Regex.match?(reg, "<div class=\"col-lg-6\" id=\"aseasd\" asdf=\"\"> </div>") == true
    assert Regex.match?(reg, "<div class=\"col-lg-6\" id=\"aseasd\" asdf=\"\" ghjk> </div>") == true
  end

  test "test closing regex matches" do
    %{closing: reg} = Xmhell.Parser.get_regexes
    assert Regex.match?(reg, "<div> </div>") == true
    assert Regex.match?(reg, "<div class=\"\"> </div>") == true
    assert Regex.match?(reg, "<div class=\"col-lg-6\"> </div>") == true
    assert Regex.match?(reg, "<div class=\"col-lg-6\" id=\"aseasd\"> </div>") == true
    assert Regex.match?(reg, "<div class=\"col-lg-6\" id=\"aseasd\" asdf=\"\"> </div>") == true
    assert Regex.match?(reg, "<div class=\"col-lg-6\" id=\"aseasd\" asdf=\"\" ghjk> </div>") == true
  end
end
