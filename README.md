# AttributeFilter

Better mass assignment with an attribute filter abstraction.

AttributeFilter is built to be extensible. You can sanitize attributes with a 
built-in or custom strategy. We provide whitelist and blacklist sanitization 
strategies, similar to Rails' attr_accessible and attr_protected.

Additionally you can respond to when sanitization occurs via a built-in 
or custom listener.

## Installation

Add this line to your application's Gemfile:

    gem 'attribute_filter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install attribute_filter

## Usage

``` ruby
  class UserAttributeFilter < AttributeFilter::Filter
    strategy :white_list,
      white_list: [:first_name, :last_name, :login, :password, :password_confirmation]
    listener :logger
    listener :exceptional
  end

  User.new({protected_attribute: "blah", first_name: "John"},
    filter: UserAttributeFilter)
```

## Defining Your Own Strategy

It's easy to define your own sanitization strategy

``` ruby
  class MyStrategy < AttributeFilter::Strategy
    def sanitize(attributes = {})
      #build your sanitization implementation here
    end
  end

  AttributeFilter.add_strategy(:mine, MyStrategy)
```

## Defining Your Own Listener

Listeners are fired when attributes are sanitized from a mass assignment call.

``` ruby
  class MyListener < AttributeFilter::SanitizationListener
    def attributes_sanitized(old_attributes, new_attributes)
      #respond to sanitization your own way here
    end
  end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

