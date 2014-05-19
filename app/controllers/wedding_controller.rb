class WeddingController < ApplicationController
  def index
    @eeid = CGI::escape("#{params[:eeid]}")
    @guest = Guest.find_by_email_encrypted(CGI::unescape("#{@eeid}"))
    unless @guest.nil?
      @guest.response.blank? ? @response = Response.new : @response = @guest.response
      @email = @guest.decrypt(:email, CGI::unescape("#{@eeid}"))
    end
  end
end
