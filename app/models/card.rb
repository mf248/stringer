class Card < ActiveRecord::Base
  attr_accessible :content, :subject, :cards_attributes
  belongs_to :user

  validates :content, length: { maximum: 500 }
  validates :subject, presence: true, length: { maximum: 40 }
  validates :user_id, presence: true
end
