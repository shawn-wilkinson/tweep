class Question < ActiveRecord::Base
  belongs_to :game
  belongs_to :tweeter
  belongs_to :guessed_tweeter, class_name: :Tweeter

  def tweeter_options
    possibilities = Tweeter.where.not(id:tweeter_id).sample(3)
    possibilities << self.tweeter
    return possibilities.shuffle
  end

  def set_guess(tweeter_id)
    self.guessed_tweeter = Tweeter.find(tweeter_id)
  end

  def correct?
    self.tweeter == self.guessed_tweeter
  end

end
