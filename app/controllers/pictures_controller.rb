class PicturesController < ApplicationController
  # before_action :find_picture

  def index
    @pictures = Picture.all
  end

  def show
    # params
    @picture = Picture.find(params[:id])
    # @tag = @picture.tags.new
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(picture_params)
    @picture.user_id = current_user.id
    @picture.save
    redirect_to user_path(current_user)
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(picture_params)
    redirect_to @picture, notice: "updated"
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to user_path(current_user)
  end

  # def new_array
  #   @pictures ||= Array.new
  #   @pictures.push(url)
  #   @pictures
  # end

  # def random
  #   new_array[rand(new_array.length)]
  # end

  # def gfycat_convert
  #   @picture = Picture.find(params[:id])
  #   @picture.url.gsub(/http:\/\//, '')
  #   @picture.url.gsub(/https:\/\//, '')
    # @picture.url.chomp('https')
  #   @picture
  #   # url = "http://upload.gfycat.com/transcode?fetchUrl=#{@picture.url}"
  # end

  # def gfycat_url
  #   ""["gfyname"]
  # end

  private

    def find_picture
      @picture = Picture.find(params[:id])
    end

    def picture_params
      params.require(:picture).permit(:id, :url, :times_saved, :times_skipped, :user_id)
    end

end
