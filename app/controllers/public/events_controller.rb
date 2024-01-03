class Public::EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
  end

  def destroy
    @event = Event.find(params[:id])
  end

  def done
  end

  def unpaid
  end
end
