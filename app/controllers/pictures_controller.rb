class PicturesController < ApplicationController

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
    @picture.user = current_user
    @picture.save
    redirect_to pictures_path
  end

  private

    def find_picture
      @picture = Picture.find(params[:id])
    end

    def picture_params
      params.require(:picture).permit(:url, :times_saved, :times_skipped, :user_id)
    end

end
