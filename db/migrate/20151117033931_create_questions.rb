class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :tweeter
      t.references :guessed_tweeter
      t.references :game
      t.string :tweet_content

      t.timestamps null: false
    end
  end
end
