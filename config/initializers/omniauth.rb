Rails.application.config.middleware.use OmniAuth::Builder do

  #OmniAuth.config.logger = Rails.logger

  provider :twitter, Settings.Twitter.AppId, Settings.Twitter.AppSecret

  #OmniAuth.config.on_failure = SourcesController.action(:oauth_failure)
end
