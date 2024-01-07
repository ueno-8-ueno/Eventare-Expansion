class Admin::EventsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    # 降順で, 20件ごとにページネーション
    @events = Event.all.order(id: "DESC").page(params[:page]).per(20)
  end

  def show
    @event = Event.find(params[:id])
  end
end
