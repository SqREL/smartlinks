module Smartlinks

  def self.linkify(text, attrs={})
    linkificator = Linkificator.new text, attrs

    # NOTE: Order matters!
    [:email, :link, :account, :hashtag].each { |method| linkificator.send method }

    linkificator.text
  end
end
