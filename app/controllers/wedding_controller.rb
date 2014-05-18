class WeddingController < ApplicationController
  def index
    if params[:id]
      @guest = Guest.find_by_email_encrypted(params[:id])
      if @guest.response.blank?
        @response = Response.new
      else
        @response = @guest.response
      end
    else
      @guest = nil
    end
  end
end
