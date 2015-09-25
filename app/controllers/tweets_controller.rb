require 'carrierwave/orm/activerecord'
class TweetsController < ApplicationController

  def index
    # @tweet = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    uploader = AvatarUploader.new
    uploader.store!(my_file)
    @tweet.save
  end

  def sho
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
    params.require(:tweet).permit(:content)
  end

end
