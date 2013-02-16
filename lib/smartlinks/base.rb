module Smartlinks

  def self.linkify(text, params={})
    linkificator = Linkificator.new text, params

    # NOTE: Order matters!
    [:email, :link, :account, :hashtag].each { |method| linkificator.send method }

    linkificator.text
  end
end
