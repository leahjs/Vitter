class AddAvatarToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :avatar, :string
  end
end
