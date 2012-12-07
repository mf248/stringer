class Card < ActiveRecord::Base
  
  belongs_to :user
  has_many :slots, dependent: :destroy
  accepts_nested_attributes_for :slots
  attr_accessible :content, :subject, :slot_attributes, :slots

  validates :content, length: { maximum: 500 }
  validates :subject, presence: true, length: { maximum: 40 }
  validates :user_id, presence: true
end
