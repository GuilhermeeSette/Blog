class HomeController < BaseController
  def index
    @posts = Post.take(5).sort()
  end
end
