class Guest < ActiveRecord::Base
  has_one :response, dependent: :destroy
  has_one :shortened_url, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true
  attr_encrypted :email, :key => 'a secret key', :attribute => 'email_encrypted'
end
