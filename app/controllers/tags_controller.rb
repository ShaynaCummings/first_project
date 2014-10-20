class TagsController < ApplicationController
  before_action :authenticate_user!

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
  end


end
