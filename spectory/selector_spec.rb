require "spectory/helper"

describe "selectors" do
  it "transforms DANG tag#id into HTML tag with an id attribute" do
    Dang.it("<div#awesome lorem and or ipsum div>").must_equal "<div id='awesome'>lorem and or ipsum</div>"
  end

  it "transforms DANG tag.class into HTML tag with a class" do
    Dang.it("<i.pants party i>").must_equal "<i class='pants'>party</i>"
  end

  it "transforms DANG tag#id.class into HTML tag with an id and a class" do
    Dang.it("<s#pants.party woo hoo s>").must_equal "<s class='party' id='pants'>woo hoo</s>"
  end

  it "should merge shorthand and longhand classes" do
    Dang.it("<html#foo.bar[class=snap crackle pop mitch] things html>").must_equal "<html class='bar snap crackle pop mitch' id='foo'>things</html>"
  end
end
