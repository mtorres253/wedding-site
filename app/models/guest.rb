class Guest < ActiveRecord::Base
  has_one :response, dependent: :destroy
end
