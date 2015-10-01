require 'carrierwave/orm/activerecord'
class TweetsController < ApplicationController
	helper :headshot


  def index
    # @tweet = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    # upload
    @tweet.save
		redirect_to tweets_path
    # uploader = AvatarUploader.new
    # uploader.store!(my_file)
  end

  def upload
    uploaded_io = params[:tweet][:media]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
  end

  def show
  end

  def update
  end

  def edit
  end

  def destroy
  end


  private
    # def set_tweet
    #   @tweet = tweet.find(params[:id])
    # end

  def tweet_params
    params.require(:tweet).permit(:content, :media)
  end

end
