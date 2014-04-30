require 'json'
require 'webrick'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    cookie = req.cookies.select { |cook| cook.name == "_rails_lite_app"}.first
    if cookie.value != {}
      @cookie = cookie.value.to_json
      puts @cookie
    else
      @cookie = {}
      puts @cookie
    end
  end

  def [](key)
  end

  def []=(key, val)
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
  end
end
