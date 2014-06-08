class WeddingController < ApplicationController
  def index
    @eeid = CGI::escape("#{params[:eeid]}")
    @encrypted_email = CGI::unescape("#{@eeid}");
    @guest = Guest.find_by_email_encrypted("#{@encrypted_email}")
    unless @guest.nil?
      @email = @guest.decrypt(:email, @encrypted_email)
      @response = !@guest.response.blank? ? @guest.response : Response.new
    end
  end
  
  def find_guest
    @email = params[:email]
    @guest = Guest.find_by_email("#{@email}")

    respond_to do |format|
      if @guest.id
        @response = !@guest.response.blank? ? @guest.response : Response.new
        
        format.html { render partial: 'partials/form', notice: 'Sorry, we could not find your email address' }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      else
        format.html { render partial: 'partials/default', notice: 'We found you!' }
        format.json { head :no_content }
      end
    end
  end
  
end
