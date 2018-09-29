#!/Users/awead/.rubies/ruby-2.4.1/bin/ruby

require 'httparty'
require 'byebug'

class TVDB
  include HTTParty

  base_uri 'https://api.thetvdb.com/'

  attr_reader :token

  def token
    @token ||= begin
      results = self.class.post("/login", headers: headers, body: login_body.to_json)
      results.parsed_response.fetch("token")
    end
  end

  def get_episodes_by_id(id)
    self.class.get("/series/#{id}/episodes", headers: authorization)
  end

  private

    def headers
      { 'Content-Type' => 'application/json' }
    end

    def login_body
      {
        apikey: ENV["TVDB_APIKEY"],
        username: ENV["TVDB_USERNAME"],
        userkey: ENV["TVDB_USERKEY"]
      }
    end

    def authorization
      { 'Authorization': 'Bearer ' + token }
    end
end
