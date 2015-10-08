class Tweet < ActiveRecord::Base
  belongs_to :user
  # mount_uploader :avatar, AvatarUploader
  mount_base64_uploader :avatar, AvatarUploader

  attr_reader :client

    def client
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['twitter_api_key']
        config.consumer_secret     = ENV['twitter_secret_key']
        config.access_token        = ENV['twitter_access_token']
        config.access_token_secret = ENV['twitter_access_token_secret']
      end
    end
end
