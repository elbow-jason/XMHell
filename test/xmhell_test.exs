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

  test "get_opening_tag returns the opening tag and xml less the opening tag" do
    expected = "<div class=\"giant\">"
    assert Xmhell.Parser.get_opening_tag(simple) == expected
  end

  test "get_closing_tag returns the closing tag of an xml string" do
    expected = "</div>"
    assert Xmhell.Parser.get_closing_tag(simple) == expected
  end

  test "remove_closing_tag returns the xml without the closing tag" do
    expected = "<div class=\"giant\">\n<h1> Yea </h1>"
    assert Xmhell.Parser.remove_closing_tag(simple) == expected
  end

  test "test opening regex matches" do
    %{opening: reg} = Xmhell.Parser.get_regexes
    assert Regex.match?(reg, "<div>") == true
    assert Regex.match?(reg, "<div class=\"\">") == true
    assert Regex.match?(reg, "<div class=\"col-lg-6\">") == true
    assert Regex.match?(reg, "<div class=\"col-lg-6\" id=\"aseasd\">") == true
    assert Regex.match?(reg, "<div class=\"col-lg-6\" id=\"aseasd\" asdf=\"\">") == true
    assert Regex.match?(reg, "<div class=\"col-lg-6\" id=\"aseasd\" asdf=\"\" ghjk>") == true
  end

  test "test closing regex matches" do
    %{closing: reg} = Xmhell.Parser.get_regexes
    assert Regex.match?(reg, "</div>") == true
  end

  test "clean_whitespace works" do
    assert Xmhell.Parser.clean_whitespace("  LEFT") == "LEFT"
    assert Xmhell.Parser.clean_whitespace("RIGHT   ") == "RIGHT"
    assert Xmhell.Parser.clean_whitespace("   BOTH   ") == "BOTH"
  end

  test "remove_the_tag works" do
    expected1 = {"abcdef", "g"}
    expected2 = {"<div>", "</div>"}
    assert Xmhell.Parser.remove_the_tag("abcdef", "abcdefg") == expected1
    assert Xmhell.Parser.remove_the_tag("<div>", "<div></div>") == expected2
  end
end
