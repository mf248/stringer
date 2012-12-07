class User < ActiveRecord::Base
  has_many :cards, dependent: :destroy
  has_many :slots, through: :cards
  accepts_nested_attributes_for :cards, :slots
  attr_accessible :name, :email, :password, :password_confirmation, :card_attributes, :cards, :slots, :slot_attrivutes
  
  has_secure_password
  
  

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token


  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def feed
    Slot.where("card_id = ?", id)
  end

  private

  	def create_remember_token
  		self.remember_token = SecureRandom.urlsafe_base64
  	end
end
