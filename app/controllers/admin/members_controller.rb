class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.update(is_active: !@member.is_active)
    redirect_to admin_member_path(@member)
  end
end
