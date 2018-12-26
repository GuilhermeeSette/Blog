class UsersController < ApplicationController
  skip_before_action :authorize, only: [:create]
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_url, notice: "Usuário #{@user.name} criado com sucesso!"
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
