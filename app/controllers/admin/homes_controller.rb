class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @members = Member.all
  end
end
