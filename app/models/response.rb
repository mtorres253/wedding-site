class Response < ActiveRecord::Base
  belongs_to :guest
  validates :coming, presence: true
end
