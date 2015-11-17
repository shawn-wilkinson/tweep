class CreateTweeters < ActiveRecord::Migration
  def change
    create_table :tweeters do |t|
      t.string :name
      t.string :twitter_handle

      t.timestamps null: false
    end
  end
end
