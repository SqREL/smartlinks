require 'spec_helper'

describe Smartlinks do

  it "modifies http url" do
    text, result = data "http"
    Smartlinks::linkify(text).should eql(result)
  end
  it "modifies https url" do
    text, result = data "https"
    Smartlinks::linkify(text).should eql(result)
  end
  it "modifies ftp url" do
    text, result = data "ftp"
    Smartlinks::linkify(text).should eql(result)
  end
  it "modifies http url" do
    text, result = data "http"
    Smartlinks::linkify(text).should eql(result)
  end

  it "do not modifyes if allready link" do
    text = "Allready <a href=\"http://google.com\">linkifyed</a> url"
    Smartlinks::linkify(text).should eql(text)
  end

  it "modifyes plaintext mail account to link" do
    text = "Reply to admin@test.com and check user@gmail.com account"
    result = "Reply to <a href=\"mailto:admin@test.com\">admin@test.com</a> and check <a href=\"mailto:user@gmail.com\">user@gmail.com</a> account"
    Smartlinks::linkify(text).should eql(result)
  end

  it "creates twitter links" do
    text = "@sqrel, check out @dht twitter"
    result = "<a href=\"https://twitter.com/sqrel\">@sqrel</a>, check out <a href=\"https://twitter.com/dht\">@dht</a> twitter</a>"
    Smartlinks::linkify(text).should eql(result)
  end

  it "creates twitter-like links with custom domain" do
    text = "@sqrel, check out @dht account"
    result = "<a href=\"http://test.com/sqrel\">@sqrel</a>, check out <a href=\"http://test.com/dht\">@dht</a> account</a>"
    Smartlinks::linkify(text, url: "http://test.com").should eql(result)
  end

  private
    def data(protocol)
      text = "Word #{protocol}://lorem.com/id/1 seperator #{protocol}://test.com/foo/bar Foo"
      result = "Word <a href=\"#{protocol}://lorem.com/id/1\">#{protocol}://lorem.com/id/1</a> seperator <a href=\"#{protocol}://test.com/foo/bar\">#{protocol}://test.com/foo/bar</a> Foo"
      [text, result]
    end

end