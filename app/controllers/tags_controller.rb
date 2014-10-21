class TagsController < ApplicationController
  # before_action :find_tag
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
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

  # def edit
  #   @tag = Tag.find(params[:id])
  # end

  # def update
  # end

  def destroy
    @tag = Tag.find(params[:id])
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
