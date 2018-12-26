class HomeController < BaseController
  skip_before_action :authorize
  def index
    @posts = Post.all.sort{|a,b| b <=> a}.take(5)
  end
end
