class PasswordsController < Clearance::PasswordsController
  def custom_edit
    @user = current_user
    render template: "passwords/custom_edit"
  end

  def custom_update
    @user = current_user
    if @user.update_password(params[:user][:password])
      redirect_to sign_in_path, success: "Password successfully updated. Please sign in."
    else
      flash[:warning] = "Error in updating password."
    end
  end
end
