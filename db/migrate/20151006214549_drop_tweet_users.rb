class DropTweetUsers < ActiveRecord::Migration
  def change
    drop_table :Tweets_Users
  end
end
