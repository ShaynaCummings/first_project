class TagsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :find_tag, only: [:show, :destroy]

  def index
     @tags = Tag.all
  end

  def show
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create(tag_params)
    @tag.user_id = current_user.id
    if @tag.save
      redirect_to @tag, notice: "tagged"
    else
      render :new
    end
  end


  def destroy
    @tag.destroy
    redirect_to :back, notice: "tag deleted!"
  end

  private

    def find_tag
      @tag = Tag.find(params[:id])
    end

    def tag_params
      params.require(:tag).permit(:tag_name, :picture_id, :user_id)
    end


end
