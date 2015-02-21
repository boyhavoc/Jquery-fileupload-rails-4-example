class UploadsController < ApplicationController

  before_filter :load_upload, only: [:edit, :update, :destroy, :show]

  def index
  end

  def create
    @upload = Upload.new(:upload => params[:files].first)
    respond_to do |format|
      if @upload.save
        format.html {render :json => {files: [@upload.to_jq_upload].to_json}, :content_type => 'text/html', :layout => false}
        format.json { render json: {files: [@upload.to_jq_upload]}, status: :created, location: uploads_path }
      else
        format.html { render action: "new" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to uploads_path }
      format.json { head :no_content }
    end
  end


private

  def load_upload
    @upload = Upload.find(params[:id])
  end


end
