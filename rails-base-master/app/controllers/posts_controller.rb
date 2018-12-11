class PostsController <ApplicationController
  before_action :set_post, only: :show

  def index
    if params[:search]
      @all_posts = Post.where("lower(title) like ?","%#{params[:search].downcase}%").order(:title).page params[:page]
    elsif params[:tag]
      @all_posts = Post.tagged_with(params[:tag]).page params[:page]
    else
      @all_posts = Post.all.order(:title).page params[:page]
    end
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Post criado com sucesso.'
    else
      render :new
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :autor, :tag_list)
  end
end
