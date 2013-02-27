module Smartlinks

  def self.linkify(text, attrs={})
    # Ensure text is not nil
    return nil unless text

    linkificator = Linkificator.new text, attrs

    # NOTE: Order matters!
    [:email, :link, :account, :hashtag].each { |method| linkificator.send method }

    linkificator.text
  end
end
