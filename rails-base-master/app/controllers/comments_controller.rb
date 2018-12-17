class CommentsController < BaseController
  before_action :set_comment, only: :show
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to posts_path, notice: 'Comentário realizado.'
    else
      render :show
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :author, :parent_comment_id)
  end
end
