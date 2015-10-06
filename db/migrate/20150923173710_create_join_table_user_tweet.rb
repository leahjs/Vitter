class CreateJoinTableUserTweet < ActiveRecord::Migration
  def change
    create_join_table :Users, :Tweets do |t|
      t.index [:user_id, :tweet_id]
      t.index [:tweet_id, :user_id]
    end
  end
end
