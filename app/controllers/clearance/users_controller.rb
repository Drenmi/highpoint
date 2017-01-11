class Clearance::UsersController < Clearance::BaseController
  before_action :prepare_modal_user

  def create
    @user = user_from_params

    respond_to do |format|
      if @user.save
        UserMailer.welcome_email(@user).deliver_later
        format.js {}
        format.html {}
        redirect_to :back, success: "User was successfully created."
      else
        format.js
      end
    end
  end

  private

  def avoid_sign_in
    warn "[DEPRECATION] Clearance's `avoid_sign_in` before_filter is " \
         "deprecated. Use `redirect_signed_in_users` instead. " \
         "Be sure to update any instances of `skip_before_filter :avoid_sign_in`" \
         " or `skip_before_action :avoid_sign_in` as well"
    redirect_signed_in_users
  end

  def redirect_signed_in_users
    redirect_to Clearance.configuration.redirect_url if signed_in?
  end

  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
    end
  end

  def user_params
    params[Clearance.configuration.user_parameter] || {}
  end

  def prepare_modal_user
    @modal_user = User.new
  end
end
