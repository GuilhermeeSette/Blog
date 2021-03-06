class PostsController <ApplicationController
  skip_before_action :authorize, only: [:show, :index]
  before_action :set_post, only: [:show, :create]
  has_scope :search_by_title
  has_scope :filter_tags
  def index

    @all_posts = Post.all.order(created_at: :desc)
    if params[:search].present?
      @all_posts = @all_posts.search_by_title(params[:search]).all.page(params[:page])
    end
    if params[:tags_ids].present?
      parameters = params[:tags_ids].split(', ').uniq
      @tags_searched = Tag.filter_tags(params[:tags_ids])
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
    if params[:id]
      @post = Post.find(params[:id])
    end
  end

  def post_params
    params.require(:post).permit(:title, :content, :autor, :tag_list)
  end
end
