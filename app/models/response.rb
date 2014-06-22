class Response < ActiveRecord::Base
  belongs_to :guest
  
  validates_inclusion_of :coming, in: [true, false], :message => "Click on one of the gray buttons below to let us know if you're coming."
end
