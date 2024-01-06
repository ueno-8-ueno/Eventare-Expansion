class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    # 降順で, 25件ごとにページネーション
    @members = Member.all.order(id: "DESC").page(params[:page]).per(20)
  end
end
