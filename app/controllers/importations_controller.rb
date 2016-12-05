class ImportationsController < ApplicationController
    
  def show
    @importation = Importation.find(params[:id])
  end

  def new
    @importation = Importation.new
  end

  def create
    @importation = Importation.new(importation_params)

    unless importation_params[:file].is_a? ActionDispatch::Http::UploadedFile
      redirect_to(new_importation_path, notice: t('.file_cannot_be_empty')) and return
    end

    respond_to do |format|
      if @importation.save
        Contact.savecontact @importation
        format.html { redirect_to @importation, notice: t('.file_uploaded_contacts_being_created.') }
      else
        format.html { render :new }
      end
    end
  end

  private

    def importation_params
      params.require(:importation).permit(:file)
    end
end
