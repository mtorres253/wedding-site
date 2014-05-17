class WeddingController < ApplicationController
  def index
    if params[:guest]
      @guest = Guest.find(params[:guest])
      if @guest.response.blank?
        @response = Response.new
      else
        @response = @guest.response
      end
    else
      @guest = nil
    end
  end
  
  def rsvp
    
  end
end
