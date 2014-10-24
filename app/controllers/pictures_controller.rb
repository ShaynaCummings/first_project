class PicturesController < ApplicationController
  before_action :find_picture, only: [:show, :edit, :update, :destroy]

  def index
    @pictures = Picture.all
    @tags = Tag.all
  end

  def show
    @tag = @picture.tags.new
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(picture_params)
    @picture.gfy_url = @picture.gfy_convert(@picture.url)
    @picture.save
    redirect_to user_path(current_user)
  end

  def edit
  end

  def update
    @picture.update(picture_params)
    redirect_to @picture, notice: "updated"
  end

  def destroy
    @picture.destroy
    redirect_to user_path(current_user), notice: "picture deleted!"
  end


  private

    def find_picture
      @picture = Picture.find(params[:id])
    end

    def picture_params
      params.require(:picture).permit(:id, :url, :times_saved, :times_skipped, :user_id)
    end

end
