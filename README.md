xignature - xignature renamed.
=========

[![Build Status](https://secure.travis-ci.org/xn/xignature.png?branch=master)](http://travis-ci.org/xn/xignature)

Examples
--------

Client example

```ruby
params       = {:some => 'parameters'}
token        = Xignature::Token.new('my_key', 'my_secret')
request      = Xignature::Request.new('POST', '/api/thing', params)
auth_hash    = request.sign(token)
query_params = params.merge(auth_hash)

HTTParty.post('http://myservice/api/thing', {
  :body => query_params
})
```

`query_params` looks like:

```ruby
{
  :some           => "parameters",
  :auth_timestamp => 1273231888,
  :auth_xignature => "28b6bb0f242f71064916fad6ae463fe91f5adc302222dfc02c348ae1941eaf80",
  :auth_version   => "1.0",
  :auth_key       => "my_key"
}

```
Server example (sinatra)

```ruby
error Xignature::AuthenticationError do |controller|
  error = controller.env["sinatra.error"]
  halt 401, "401 UNAUTHORIZED: #{error.message}\n"
end

post '/api/thing' do
  request = Xignature::Request.new('POST', env["REQUEST_PATH"], params)
  # This will raise a Xignature::AuthenticationError if request does not authenticate
  token = request.authenticate do |key|
    Xignature::Token.new(key, lookup_secret(key))
  end

  # Do whatever you need to do
end
```

Developing
----------

    bundle
    bundle exec rspec spec/*_spec.rb

Please see the travis status for a list of rubies tested against

Copyright
---------

Copyright (c) 2010 Martyn Loughran. See LICENSE for details.
