class TweetCategory < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :tweets

  def self.ordered_all
    TweetCategory.all.order(:name)
  end

end
