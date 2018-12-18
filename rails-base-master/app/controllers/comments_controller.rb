class CommentsController < BaseController
  before_action :set_comment, only: :show
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.js
        format.html{ redirect_back fallback_location: root_path, notice: 'Comentário realizado.' }
      else
        render :new
      end
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
