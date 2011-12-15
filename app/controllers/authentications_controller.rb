class AuthenticationsController < ApplicationController
  # GET /authentications
  # GET /authentications.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: "{}" }
    end
  end

  # DELETE /authentications/1
  # DELETE /authentications/1.json
  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy

    respond_to do |format|
      format.html { redirect_to authentications_url }
      format.json { head :ok }
    end
  end
end
