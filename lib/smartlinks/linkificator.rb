module Smartlinks
  class Linkificator

    attr_reader :text

    # ---------- Regex patterns ----------
    PAT_LINK = %r{
      (?: ((?:ed2k|ftp|http|https|irc|news|gopher|nntp|telnet|webcal|xmpp|callto|feed|svn|urn|aim|rsync|tag|ssh|sftp|rtsp|afs):)// | www\. )
      [^\s<]+
    }x
    PAT_EMAIL = %r{
      [a-z0-9!#$\%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$\%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?
    }x
    PAT_ACCOUNT = %r{(^|\s)@(\w+)}
    PAT_HASH = %r{#(\w+)}
    # ------------------------------------

    def initialize(text, params={})
      @text = text
      @params = params
    end

    def email
      @text.gsub! PAT_EMAIL do |email|
        "<a href=\"mailto:#{email}\">#{email}</a>"
      end
    end

    def link
      @text.gsub! PAT_LINK do |url|
        "<a href=\"#{url}\">#{url}</a>"
      end
    end

    def account
      @text.gsub!(PAT_ACCOUNT) do
        space, account = $~[1], $~[2]

        if @params[:account]
          url = @params[:account].sub "%s", account
          "#{space}<a href=\"#{url}\">@#{account}</a>"
        else
          "#{space}<a href=\"https://twitter.com/#{account}\">@#{account}</a>"
        end
      end
    end

    def hashtag
      @text.gsub!(PAT_HASH) do
        hashtag = $~[1]

        if @params[:hashtag]
          url = @params[:hashtag].sub "%s", hashtag
          "<a href=\"#{url}\">##{hashtag}</a>"
        else
          "<a href=\"https://twitter.com/search?q=%23#{hashtag}&src=hash\">##{hashtag}</a>"
        end
      end
    end

  end
end
