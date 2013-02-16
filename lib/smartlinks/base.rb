module Smartlinks
  PAT_LINK = %r{
    (?: ((?:ed2k|ftp|http|https|irc|mailto|news|gopher|nntp|telnet|webcal|xmpp|callto|feed|svn|urn|aim|rsync|tag|ssh|sftp|rtsp|afs):)// | www\. )
    [^\s<]+
  }x
  PAT_EMAIL = %r{
    [a-z0-9!#$\%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$\%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?
  }x

  def self.linkify(text, params={})
    text.gsub! PAT_EMAIL do |email|
      "<a href=\"mailto:#{email}\">#{email}</a>"
    end

    text.gsub! PAT_LINK do |url|
      "<a href=\"#{url}\">#{url}</a>"
    end

    text
  end
end
