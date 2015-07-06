class StatesController < ApplicationController
  load_and_authorize_resource
  before_action :set_state, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @states = State.all
    respond_with(@states)
  end

  def show
    respond_with(@state)
  end

  def new
    @state = State.new
    respond_with(@state)
  end

  def edit
  end

  def create
    @state = State.new(state_params)
    respond_with(@state) do |format|
      format.html { 
        if @state.save 
          flash[:notice] = 'State was successfully created.' 
          redirect_to states_url 
        else 
          render 'new'
        end
      }
    end
  end

  def update
    respond_with(@state) do |format|
      format.html { 
        if @state.update(state_params)
          flash[:notice] = 'State was successfully updated.' 
          redirect_to states_url 
        else 
          render 'edit'
        end
      }
    end
  end

  def destroy
    @state.destroy
    respond_with(@state)
  end

  private
  def set_state
    @state = State.find(params[:id])
  end

  def state_params
    params.require(:state).permit(:name, :country_id)
  end
end
