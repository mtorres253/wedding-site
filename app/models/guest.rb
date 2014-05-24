class Guest < ActiveRecord::Base
  has_shortened_urls
  has_one :response, dependent: :destroy
  attr_encrypted :email, :key => 'a secret key', :attribute => 'email_encrypted'
  
  validates :name, presence: true
  validates :email, presence: true
  
end
