require 'json'
require 'webrick'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    cookie = req.cookies.select { |cook| cook.name == "_rails_lite_app"}.first
    if cookie.nil?
      @data = {}
    else
      @data = JSON.parse(cookie.value)
    end
  end

  def [](key)
    @data[key]
  end

  def []=(key, val)
    @data[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    res.cookies << WEBrick::Cookie.new("_rails_lite_app", @data.to_json)
  end
end
