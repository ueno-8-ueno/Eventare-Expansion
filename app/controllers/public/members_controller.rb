class Public::MembersController < ApplicationController
  before_action :is_matching_login_member, only: [:edit, :update, :unregistration, :withdrawal]

  def show
    @member = Member.find(params[:id])
  end

  def index
    @members = Member.all
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])

    if @member != current_member
      redirect_to member_path(current_member.id)
      return
    end

    if @member.update(member_params)
      flash[:notice] = "プロフィールの編集が完了しました"
      redirect_to member_path(current_member.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def unregistration
  end

  def withdrawal
    member = current_member
    member.is_active = false
    sign_out_and_redirect(current_member)
  end

  private
  
  # ストロングパラメータ
  def member_params
    params.require(:member).permit(:name, :introduction, :profile_image)
  end

  # ユーザプロフィールへのアクセス制御
  def is_matching_login_member
    member = Member.find(params[:id])
    unless member.id == current_member.id
      redirect_to member_path(current_member)
    end
  end
end
