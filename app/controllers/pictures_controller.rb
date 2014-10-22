class PicturesController < ApplicationController
  # before_action :find_picture
  require 'pry'

  def index
    @pictures = Picture.all
    @tags = Tag.all
  end

  def show
    # params
    @picture = Picture.find(params[:id])
    # @tag = Tag.picture.find(params[:id])
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

  def gfycat_convert
    binding.pry
    @picture = Picture.find(params[:id])
    @picture.url
    @httpless = @picture.url.gsub(/http:\/\//, '')
    # @picture.url.gsub(/https:\/\//, '')
    # @picture.url.chomp('https')
    @upload_url = "http://upload.gfycat.com/transcode?fetchUrl=#{@httpless}"
    @gfycat_results = HTTParty.get(@upload_url)
    @gfy_slug = @gfycat_results["gfyName"]
    @gfy_url = "http://www.gfycat.com/#{@gfy_slug}"
   end

  # def gfycat_url
  # end

  private

    def find_picture
      @picture = Picture.find(params[:id])
    end

    def picture_params
      params.require(:picture).permit(:id, :url, :times_saved, :times_skipped, :user_id)
    end

end
