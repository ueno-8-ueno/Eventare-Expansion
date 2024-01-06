class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @member = Member.find(params[:id])

    # 降順で, 20件ごとにページネーション
    @events = @member.events.order(id: "DESC").page(params[:page]).per(20)
  end

  def update
    @member = Member.find(params[:id])
    @member.update(is_active: !@member.is_active)
    redirect_to admin_member_path(@member)
  end
end
