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
      if !@guest.nil?
        if @guest.response.blank?
          @response = Response.new
          format.html { render partial: 'partials/form', notice: "We don't have your RSVP yet" }
          format.json { render json: @response.errors, status: :unprocessable_entity }
        else
          @response = @guest.response
          format.html { render partial: 'partials/show', notice: 'We Found You!' }
          format.json { render json: @response.errors, status: :unprocessable_entity }
        end
      else
        format.html { render partial: 'partials/default', locals: { alert: "We're sorry, we can't find your email address. Please try again." } }
        format.json { head :no_content }
      end
    end
  end
  
end
