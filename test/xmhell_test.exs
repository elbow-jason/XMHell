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

  

end
