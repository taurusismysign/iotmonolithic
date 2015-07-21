require 'exceptions/connector_api_error'
require 'exceptions/connector_connection_error'
require 'nlogger'
require 'twitter'

class TwitterConnector

  # @param [Object] oauth_key
  # @param [Object] oauth_verifier
  # @param [Object] pull_count
  def initialize( consumer_key, consumer_secret, oauth_key, oauth_verifier)
    begin
      # connect to twitter and get the data
      @twclient = Twitter::REST::Client.new(
        :access_token => "2475756498-Qfbb6lKEFL2jjotVfpwYnkp9fIngiD7jbRrP5oe",
            :access_token_secret => "girHQP3wRa6ifHeJ4IlWwWVhGYbr29hQzSsqEqREwIAph",
            :consumer_key => "nZ38qeNIoHWrhScFBcFAWYiip",
            :consumer_secret => "0IDud2yTAWBXVe4vGeQhFYmV8WtbsK9kW7F5QixEYQqXTKQUBK"
      )

    rescue Twitter::Error => te
      raise ConnectorConnectionError.new("Couldn't connect to Twitter")
    end

    @pull_count = 100
  end

  def embed(id)
    @twclient.oembed(id,{omit_script: true})
  end

  def follow_account(acc)
    begin
      @twclient.follow(acc)
      return true
    rescue Twitter::Error => e
      return false
    end
  end

  def timeline(handle, since_id, pull_all)
    begin
    if pull_all then
      @twclient.home_timeline({count: @pull_count, since_id: since_id, exclude_replies: true})
    else
      @twclient.user_timeline(handle, {count: @pull_count, since_id: since_id, exclude_replies: true})
    end
    rescue Twitter::Error => e
      raise ConnectorApiError.new(e.message)
    end
  end

end
