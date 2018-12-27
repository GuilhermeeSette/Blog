class CommentsController < BaseController
  skip_before_action :authorize
  before_action :set_comment, only: :show
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author = User.find(session[:user_id]).name
    if @comment.author.empty?
      @comment.author = 'Anonymous'
    end
    respond_to do |format|
      if @comment.save
        format.html{ redirect_back fallback_location: root_path, notice: 'Comentário realizado.' }
        format.js
      else
        format.html { render :new }
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
