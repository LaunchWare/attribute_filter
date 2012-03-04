# AttributeFilter

Better mass assignment with an attribute filter abstraction.

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
      attributes: [:first_name, :last_name, :login, :password, :password_confirmation]
  end

  User.new({protected_attribute: "blah", first_name: "John"}, 
    filter: UserAttributeFilter)
```

## Defining Your Own Strategy

It's easy to define your own sanitization strategy

``` ruby
  class MyStrategy < AttributeFilter::Strategy
    def sanitize(attributes = {})
      #your implementation here
    end
  end

  AttributeFilter.add_strategy(:mine, MyStrategy)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

