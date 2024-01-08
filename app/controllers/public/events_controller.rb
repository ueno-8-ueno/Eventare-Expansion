class Public::EventsController < ApplicationController
  before_action :authenticate_member!
  before_action :is_matching_login_member, only: [:edit, :update]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.member_id = current_member.id
    if @event.save
      flash[:notice] = "イベントTODOの投稿が完了しました"
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @search_msg = ""

    if params[:event_name] && params[:event_name] != ""
      # 検索結果を降順で, 20件ごとにページネーション
      @events = Event.where("name like ?","%#{params[:event_name]}%").order(id: "DESC").page(params[:page]).per(20)
      @search_msg = "「#{params[:event_name]}」で検索した結果は#{@events.count}件です"
    else
      # 降順で, 20件ごとにページネーション
      @events = Event.all.order(id: "DESC").page(params[:page]).per(20)
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.member != current_member
      redirect_to member_path(current_member.id)
      return
    end

    if @event.update(event_params)
      flash[:notice] = "イベントTODOの更新が成功しました"
      redirect_to event_path(@event)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "イベントTODOを削除しました"
    redirect_to events_path
  end

  def status
    event = Event.find(params[:id])

    if event.member != current_member
      redirect_to member_path(current_member.id)
      return
    end

    event.update(is_done: !event.is_done)
    redirect_to member_path(current_member)
  end


  private

  def event_params
    params.require(:event).permit(:name, :introduction, :genre_id, :start_at, :end_at)
  end

  # TODO編集画面へのアクセス制御
  def is_matching_login_member
    member = Event.find(params[:id]).member
    unless member.id == current_member.id
      redirect_to events_path
    end
  end
end
