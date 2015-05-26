class GroupsController < ApplicationController
  load_and_authorize_resource
  
  def block_it
  end

  def close_it
    group_detail = GroupDetail.find(params[:group_detail_id])
    group_detail.update(:status=>'Closed')
    redirect_to :back, notice: 'This group is set to closed now'
  end
end
