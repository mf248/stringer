class Slot < ActiveRecord::Base
  belongs_to :card

  attr_accessible :display_card, :friend_rank, :self_rank, :world_rank
  

  validates :card_id, presence: true

  default_scope order: 'slots.self_rank DESC'

  
end
