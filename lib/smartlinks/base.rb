module Smartlinks
  PAT_LINK = %r{
    (?: ((?:ed2k|ftp|http|https|irc|news|gopher|nntp|telnet|webcal|xmpp|callto|feed|svn|urn|aim|rsync|tag|ssh|sftp|rtsp|afs):)// | www\. )
    [^\s<]+
  }x
  PAT_EMAIL = %r{
    [a-z0-9!#$\%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$\%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?
  }x
  PAT_ACCOUNT = %r{(^|\s)@\w+}
  PAT_HASH = %r{#\w+}

  def self.linkify(text, params={})
    text.gsub! PAT_EMAIL do |email|
      "<a href=\"mailto:#{email}\">#{email}</a>"
    end

    text.gsub! PAT_LINK do |url|
      "<a href=\"#{url}\">#{url}</a>"
    end

    text.gsub!(PAT_ACCOUNT) do |account|
      whitespace = ""
      whitespace = " " if account.strip!
      account.slice!(0)

      if params[:account]
        url = params[:account].sub "%s", account
        "#{whitespace}<a href=\"#{url}\">@#{account}</a>"
      else
        "#{whitespace}<a href=\"https://twitter.com/#{account}\">@#{account}</a>"
      end
    end

    text.gsub!(PAT_HASH) do |hash|
      whitespace = ""
      whitespace = " " if hash.strip!
      hash.slice!(0)

      if params[:hash]
        url = params[:hash].sub "%s", hash
        "#{whitespace}<a href=\"#{url}\">##{hash}</a>"
      else
        "#{whitespace}<a href=\"https://twitter.com/search?q=%23#{hash}&src=hash\">##{hash}</a>"
      end
    end

    text
  end
end
