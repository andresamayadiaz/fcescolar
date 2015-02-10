class DegreeAchievementsCategoriesController < ApplicationController
  before_action :set_degree_achievements_category, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @degree_achievements_categories = DegreeAchievementsCategory.all
    respond_with(@degree_achievements_categories)
  end

  def show
    respond_with(@degree_achievements_category)
  end

  def new
    @degree_achievements_category = DegreeAchievementsCategory.new
    respond_with(@degree_achievements_category)
  end

  def edit
  end

  def create
    @degree_achievements_category = DegreeAchievementsCategory.new(degree_achievements_category_params)
    flash[:notice] = 'DegreeAchievementsCategory was successfully created.' if @degree_achievements_category.save
    respond_with(@degree_achievements_category) do |format|
      format.html { redirect_to degree_achievements_categories_url }
    end
  end

  def update
    flash[:notice] = 'DegreeAchievementsCategory was successfully updated.' if @degree_achievements_category.update(degree_achievements_category_params)
    respond_with(@degree_achievements_category) do |format|
      format.html { redirect_to degree_achievements_categories_url }
    end
  end

  def destroy
    @degree_achievements_category.destroy
    respond_with(@degree_achievements_category)
  end

  private
    def set_degree_achievements_category
      @degree_achievements_category = DegreeAchievementsCategory.find(params[:id])
    end

    def degree_achievements_category_params
      params.require(:degree_achievements_category).permit(:franchise_id, :name, :status)
    end
end
