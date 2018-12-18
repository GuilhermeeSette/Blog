class PostsController <ApplicationController
  before_action :set_post, only: :show

  def index
    @all_posts = Post.all.order(created_at: :desc)
    if params[:search].present?
      @all_posts = @all_posts.where("lower(title) like ?","%#{params[:search].downcase}%")
    end
    if params[:tags_ids].present?
      parameters = params[:tags_ids].split(', ').uniq
      @tags_searched = Tag.where(id: params[:tags_ids].split(', '))
      @all_posts = @all_posts.joins(:taggings)
        .where(taggings: { tag_id: parameters })
        .group(:id)
        .having("count(posts.id) = #{parameters.count}")
    end
    @all_posts = @all_posts.page(params[:page])
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
