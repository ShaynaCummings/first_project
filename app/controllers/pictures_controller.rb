class PicturesController < ApplicationController
  before_action :authenticate_user!

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find[params[:id]]
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(picture_params)
    @picture.user_id = current_user.id
    @picture.save
    redirect_to pictures_path
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(picture_params)
    redirect_to @picture, notice: "updated"
  end

  private

    def find_picture
      @picture = Picture.find(params[:id])
    end

    def picture_params
      params.require(:picture).permit(:id, :url, :times_saved, :times_skipped, :user_id)
    end

end
