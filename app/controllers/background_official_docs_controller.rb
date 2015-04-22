class BackgroundOfficialDocsController < ApplicationController
  load_and_authorize_resource
  before_action :set_background_official_doc, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @background_official_docs = BackgroundOfficialDoc.active
    respond_with(@background_official_docs)
  end

  def show
    respond_with(@background_official_doc)
  end

  def new
    @background_official_doc = BackgroundOfficialDoc.new
    respond_with(@background_official_doc)
  end

  def edit
  end

  def create
    @background_official_doc = BackgroundOfficialDoc.new(background_official_doc_params)
    @background_official_doc.save
    respond_with(@background_official_doc) do |format|
      format.html { redirect_to background_official_docs_url }
    end
  end

  def update
    @background_official_doc.update(background_official_doc_params)
    respond_with(@background_official_doc) do |format|
      format.html { redirect_to background_official_docs_url }
    end
  end

  def destroy
    @background_official_doc.update(:status=>false)
    respond_with(@background_official_doc) do |format|
      format.html { redirect_to background_official_docs_url, notice: 'Deleted successfully' }
    end
  end

  private
    def set_background_official_doc
      @background_official_doc = BackgroundOfficialDoc.find(params[:id])
    end

    def background_official_doc_params
      params.require(:background_official_doc).permit(:franchise_id, :name, :responsive_letter, :responsive_due_days, :status)
    end
end
