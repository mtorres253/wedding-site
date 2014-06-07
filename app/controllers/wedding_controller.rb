class WeddingController < ApplicationController
  def index
    @eeid = CGI::escape("#{params[:eeid]}")
    @encrypted_email = CGI::unescape("#{@eeid}");
    @guest = Guest.find_by_email_encrypted("#{@encrypted_email}")
    unless @guest.nil?
      @email = @guest.decrypt(:email, @encrypted_email)
      if @guest.response.blank? 
        @response = Response.new
      else
        @response = @guest.response
      end
    end
  end
  
end
