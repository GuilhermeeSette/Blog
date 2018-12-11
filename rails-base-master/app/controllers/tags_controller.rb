class TagsController < ApplicationController
  before_action :set_tag, only: [:index, :show]
  def index
    if params[:name]
      @tag = Tag.where("lower(name) like ?","%#{params[:name].downcase}%").order(:name).page params[:page]
    else
      @tag = Tag.all.order(:name).page params[:page]
    end
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to @tag, notice: 'Tag was successfully created.'
    else
      render :new
    end
  end

  private

    def set_tag
      if params[:id]
        @tag = Tag.find(params[:id])
      else
        @tag = Tag.all.order(:name)
      end

    end

    def tag_params
      params.require(:tag).permit(:name)
    end
end
