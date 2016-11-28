class UsersController < Clearance::UsersController
  before_action :require_admin_privileges, only: [:destroy, :index]

  def show
    @user = current_user
  end

  def index
    @users = User.all.order(created_at: :desc).paginate(page: params[:page], per_page: 15)
  end

  def destroy
    user = User.find(params[:id])
    if user.admin?
      redirect_to users_path
      flash[:danger] = "Cannot delete admin user."
    else
      user.destroy
      redirect_to users_path
      flash[:success] = "User successfully deleted."
    end
  end

  private

  def require_admin_privileges
    redirect_to root_path unless current_user.admin?
  end
end
