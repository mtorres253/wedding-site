class Admin::ResponsesController < AdminController
  http_basic_authenticate_with name: "michael", password: "blinking4", only: [:index, :show, :destroy]
  before_action :set_response, only: [:show, :edit, :update, :destroy]
  respond_to :json
  
  # GET /responses
  # GET /responses.json
  def index
    @responses = Response.all
  end

  # GET /responses/1
  # GET /responses/1.json
  def show
  end

  # GET /responses/new
  def new
    @response = Response.new
    @guests = Guest.all
  end

  # GET /responses/1/edit
  def edit
  end

  # POST /responses
  # POST /responses.json
  def create
    @response = Response.new(response_params)
    @guest = Guest.find_by_id(@response.guest_id)

    respond_to do |format|
      if @response.save
        format.html { render partial: 'partials/show', notice: 'Your RSVP has been saved' }
        format.json { render action: 'show', status: :created, location: @response }
      else
        format.html { render partial: 'partials/form', locals: { alert: @response.errors, id: @guest.id } }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responses/1
  # PATCH/PUT /responses/1.json
  def update
    
    respond_to do |format|
      if @response.update(response_params)
        format.html { render partial: 'partials/show', notice: 'Your RSVP was successfully updated' }
        format.json { head :no_content }
      else
        format.html { render partial: 'partials/form', locals: { alert: @response.errors, id: @guest.id } }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    @response.destroy
    respond_to do |format|
      format.html { redirect_to admin_responses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = Response.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def response_params
      params.require(:response).permit(:adults, :children, :guest_id, :comments, :friday_reception, :coming)
      # params[:response]
    end
end
