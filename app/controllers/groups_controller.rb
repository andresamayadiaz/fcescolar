class GroupsController < ApplicationController

  load_and_authorize_resource
  
  def block_it
  end

  def close_it
    group_detail = GroupDetail.find(params[:group_detail_id])
    group_detail.update(:status=>'Closed')
    flash[:alert]='This group status is set to close now'
    redirect_to :back
  end

  def open_it
    group_detail = GroupDetail.find(params[:group_detail_id])
    group_detail.update(:status=>'Open')
    flash[:notice]='This group status is set to open now'
    redirect_to :back
  end
end
