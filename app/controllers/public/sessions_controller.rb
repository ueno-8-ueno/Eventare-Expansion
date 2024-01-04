# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :member_state, only: [:create]

  def after_sign_in_path_for(resource)
    member_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # アクティブであるかを判断するメソッド
  def member_state
    # 【処理内容1】 入力されたemailからアカウントを1件取得
    member = Member.find_by(email: params[:member][:email])
    # 【処理内容2】 アカウントを取得できなかった場合、このメソッドを終了する
    return if member.nil?
    # 【処理内容3】 取得したアカウントのパスワードと入力されたパスワードが一致していない場合、このメソッドを終了する
    return unless member.valid_password?(params[:member][:password])

    # 【処理内容4】 アクティブでない会員に対する処理
    if !member.is_active
      redirect_to new_member_registration_path
    end
  end
end
