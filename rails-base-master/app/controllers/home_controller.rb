class HomeController < BaseController
  def index
    @posts = Post.all
  end
end
