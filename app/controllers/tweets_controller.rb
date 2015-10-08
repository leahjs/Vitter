require 'carrierwave/orm/activerecord'
require 'base64'
class TweetsController < ApplicationController


  def index
		@tweet = Tweet.where(:user_id => session[:user_id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
		@tweet = Tweet.new(:content => params[:tweet][:content], :media => params[:media], :user_id => session[:user_id])
		tmp_file = Base64.decode64(params[:media])
		file = File.open('tmp/user_media_pic.jpeg', 'wb')
		file.puts(tmp_file)
		@tweet.avatar = file
    @tweet.save
		@tweet.client.update_with_media(params[:tweet][:content], File.new('tmp/user_media_pic.jpeg'))
		file.close
		redirect_to '/tweets'
  end

	def aws_upload
		obj = S3_BUCKET.objects[:media => params[:media]]
		obj.write(
      file: @file_name,		#@tweet.id.to_s + '.jpg',
      acl: :public_read
    )
		@upload = Upload.new(
	    url: obj.public_url,
	    name: params[:tweet_id] #tweet id, user id, Time.now
		)
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
