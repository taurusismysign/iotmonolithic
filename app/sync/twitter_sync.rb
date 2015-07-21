require 'exceptions/connector_api_error'
require 'exceptions/connector_connection_error'
require 'twitter'

class TwitterSync

  def Follow(experts)
    begin
      begin
        @connector = TwitterConnector.new(Settings.Twitter.ConsumerKey,
                                          Settings.Twitter.ConsumerSecret,
                                          Settings.Twitter.AppId,
                                          Settings.Twitter.AppSecret)
      rescue ConnectorConnectionError => e
        puts e
        return
      end

      experts.each do |ex|

        status = @connector.follow_account(ex.handle)

        if(status)
          ex.is_active = 1
          ex.save
        end

        sleep(30)

      end if experts.present?

    rescue ConnectorApiError => apie
      puts apie.to_yaml
    rescue Exception => sep
      puts sep.to_yaml
    end  #end of BEGIN (from the very top)

    return
  end

  def Sync(experts)
    begin
      begin
        @connector = TwitterConnector.new(Settings.Twitter.AccessToken,
                                              Settings.Twitter.AccessTokenSecret,
                                              Settings.Twitter.AppId,
                                              Settings.Twitter.AppSecret)
          #@connector = TwitterConnector.new(s.consumer_key, s.consumer_secret, s.source_outh_key, s.oauth_verifier
      rescue ConnectorConnectionError => e
        return
      end

      #si_tweetrule = SyncRecorder.new(s.id, tweetrule.id,run_id)
      @si = Since.first_or_initialize

      if @si.new_record?
        since_id = "1"
      else
        since_id = @si.since_value
      end

      @timeline = @connector.timeline("internetoftweet", since_id, true)

      @timeline.reverse.each do |tweet|

        exp = experts.find {|e| e[:handle].downcase ==  tweet[:user][:screen_name].downcase}

        if exp.present?
          embed = @connector.embed(tweet[:attrs][:id_str])
          sreturn = Submitter.Add(tweet,exp,embed)
        end

        @si.since_value = tweet[:attrs][:id_str]


      end if @timeline.present?

    rescue ConnectorApiError => apie
      puts apie.to_yaml
    rescue Exception => sep
      puts sep.to_yaml
    ensure
      @si.save if @si.present?
    end  #end of BEGIN (from the very top)
  end # end of the function self.Sync
end # end of module