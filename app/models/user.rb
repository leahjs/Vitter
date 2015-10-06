class User < ActiveRecord::Base
	has_many :tweets
	# mount_uploader :avatar, AvatarUploader

	def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
			user.username = auth["extra"]["access_token"].params["screen_name"]
 			user.profile_photo = auth["extra"]["raw_info"].entries[27][1]
			user.followers = auth["extra"]["raw_info"].entries[9][1]
    end
  end

end
