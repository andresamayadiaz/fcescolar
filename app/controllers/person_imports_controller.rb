class PersonImportsController < ApplicationController
  def new
    @person_import = PersonImport.new
  end

  def create
    @person_import = PersonImport.new(params[:person_import])
    if @person_import.save
      redirect_to :back, notice: "Imported people successfully."
    else
      render :new
    end
  end
end
