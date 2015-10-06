require 'carrierwave/orm/activerecord'
class TweetsController < ApplicationController
	helper :headshot


  def index
  end

  def new
    @tweet = Tweet.new
  end

  def create
		# binding.pry
		 Tweet.new(:content => params[:tweet][:content], :media => params[:media])
    @tweet.save
		tweet_id = @tweet.id
		# $twitter_client = Twitter::Client.new
		# $twitter_client.update(:content => params[:tweet][:content])
		picture = params[:media]
		@file = File.open('new_picture.png', 'w') {|f| f.write(Base64.decode64(picture))}
		@file_name = File.basename("new_picture.png")
    aws_upload
		binding.pry
		@upload.save
			if @upload.save
			  flash.now[:notice] = 'picture successfully uploaded'
			else
			  flash.now[:notice] = 'There was an error'
			end
		redirect_to tweets_path
    # uploader = AvatarUploader.new
    # uploader.store!(my_file)
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
