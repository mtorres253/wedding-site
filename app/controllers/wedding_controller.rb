class WeddingController < ApplicationController
  def index
    @guests = Guest.all
    @guest = Guest.find(1)
    @response = @guest.response
  end
end
