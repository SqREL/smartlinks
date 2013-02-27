require 'spec_helper'

describe Smartlinks do

  it "returns nil if input text it is nil" do
    text = nil
    Smartlinks.linkify(text).should eql(text)
  end

  it "modifies http url" do
    text, result = data "http"
    Smartlinks.linkify(text).should eql(result)
  end
  it "modifies https url" do
    text, result = data "https"
    Smartlinks.linkify(text).should eql(result)
  end
  it "modifies ftp url" do
    text, result = data "ftp"
    Smartlinks.linkify(text).should eql(result)
  end
  it "modifies http url" do
    text, result = data "http"
    Smartlinks.linkify(text).should eql(result)
  end

  it "do not modifyes if allready link" do
    text = "Allready <a href=\"http://google.com\">linkifyed</a> url"
    Smartlinks.linkify(text).should eql(text)
  end

  it "modifyes plaintext mail account to link" do
    text = "Reply to admin@test.com and check user@gmail.com account"
    result = "Reply to <a href=\"mailto:admin@test.com\">admin@test.com</a> and check <a href=\"mailto:user@gmail.com\">user@gmail.com</a> account"
    Smartlinks.linkify(text).should eql(result)
  end

  it "creates twitter links" do
    text = "@sqrel, check out @dht twitter"
    result = "<a href=\"https://twitter.com/sqrel\">@sqrel</a>, check out <a href=\"https://twitter.com/dht\">@dht</a> twitter"
    Smartlinks.linkify(text).should eql(result)
  end

  it "creates twitter-like links with custom domain" do
    text = "@sqrel, check out @dht account"
    result = "<a href=\"http://test.com/sqrel\">@sqrel</a>, check out <a href=\"http://test.com/dht\">@dht</a> account"
    Smartlinks.linkify(text, account: "http://test.com/%s").should eql(result)
  end

  it "creates twitter hash links" do
    text = "#dude, check out #rails framework"
    result = "<a href=\"https://twitter.com/search?q=%23dude&src=hash\">#dude</a>, check out <a href=\"https://twitter.com/search?q=%23rails&src=hash\">#rails</a> framework"
    Smartlinks.linkify(text).should eql(result)
  end

  it "creates twitter-like links with custom domain" do
    text = "#dude, check out #rails framework"
    result = "<a href=\"http://example.com/dude?src=hash\">#dude</a>, check out <a href=\"http://example.com/rails?src=hash\">#rails</a> framework"
    Smartlinks.linkify(text, hashtag: "http://example.com/%s?src=hash").should eql(result)
  end

  it "converts url to link with some link params" do
    text = "http://example.com/3 Word http://lorem.com/id/1 seperator http://test.com/foo/bar Foo"
    result = "<a href=\"http://example.com/3\" class=\"main\" rel=\"nofollow\">http://example.com/3</a> Word <a href=\"http://lorem.com/id/1\" class=\"main\" rel=\"nofollow\">http://lorem.com/id/1</a> seperator <a href=\"http://test.com/foo/bar\" class=\"main\" rel=\"nofollow\">http://test.com/foo/bar</a> Foo"
    Smartlinks.linkify(text, params: { class: "main", rel: "nofollow" }).should eql(result)
  end

  private
    def data(protocol)
      text = "#{protocol}://example.com/3 Word #{protocol}://lorem.com/id/1 seperator #{protocol}://test.com/foo/bar Foo"
      result = "<a href=\"#{protocol}://example.com/3\">#{protocol}://example.com/3</a> Word <a href=\"#{protocol}://lorem.com/id/1\">#{protocol}://lorem.com/id/1</a> seperator <a href=\"#{protocol}://test.com/foo/bar\">#{protocol}://test.com/foo/bar</a> Foo"
      [text, result]
    end

end
