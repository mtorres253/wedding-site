class Guest < ActiveRecord::Base
  has_one :response, dependent: :destroy
  attr_encrypted :email, :key => 'a secret key', :attribute => 'email_encrypted'
end
