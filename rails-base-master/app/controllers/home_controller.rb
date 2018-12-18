class HomeController < BaseController
  def index
    @posts = Post.all.sort{|a,b| b <=> a}.take(5)
  end
end
