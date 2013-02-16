# SmartLinks

Gem for linkifying text

## Installation

Just as usual. If you're using bundler - just this to your Gemfile:

    gem 'smartlinks'

And then execute:

    bundle install

Or install it yourself:

    gem install smartlinks

## Usage

This gem is very simple. You have only one method, that you need. For example:

```ruby
    text = "@sqrel and @troyanryller just made a cool gem!"

    Smartlinks.linkify text
```

That's it! Now you have linkified text:

    <a href="https://twitter.com/sqrel">@sqrel</a> and <a href="https://twitter.com/troyanryller">@troyanryller</a> just made a cool gem!

By default, gem interprets @user and #hash as twitter user and hashtag, but you can explicitly define domain to user and hashtag:

    Smartlinks.linkify text, account: "http://example.com/%s", hashtag: "http://example.com/search/%s"

`%s` will be replaced to username or hash

Also you can define additional links params, for example:

    Smartlinks.linkify text, params: { class: "some-link-class", rel: "nofollow" }

## Credits

* Vasilij Melnychuk ([@SqREL](https://twitter.com/sqrel))
* Igor Petruh ([@troyanryller](https://twitter.com/troyanryller))
