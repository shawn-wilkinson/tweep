class Game < ActiveRecord::Base
  has_many :questions

  after_create :set_up_game

  def set_up_game
    tweeter_bank = Tweeter.all.sample(15)
    tweeter_bank.each do |person|
      # content = Interface.return_tweet_content(person.twitter_handle)
      content = "This is sample content tweet for #{person.name}"
      self.questions << Question.create(tweeter: person, tweet_content: content)
    end
  end

  def update_score
    p self.questions.select{|q|q.correct?}.count
  end



end
