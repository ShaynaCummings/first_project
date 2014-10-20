Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "TWITTER_CONSUMER_KEY", "TWITTER_CONSUMER_SECRET"
      {
      :secure_image_url => 'true',
      :image_size => 'original',
      :authorize_params => {
        :force_login => 'true',
        :lang => 'pt'
      }
    }
end
