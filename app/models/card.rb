class Card < ActiveRecord::Base
  attr_accessible :content, :subject
  belongs_to :user

  validates :user_id, presence: true
end
