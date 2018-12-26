class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end
  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to posts_url, notice: "#{(user.name).upcase} logado com sucesso"
    else
      redirect_to login_url, alert: "Usuário/Senha incorretos"
    end

  end
  def destroy
    session[:user_id] = nil
    redirect_to home_index_url, notice: "Usuário saiu!"
  end

end