class ImagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @images = current_user.images
  end
  def new
    @image = current_user.images.build
  end
  def create
    @image = current_user.images.new(image_params)
      if @image.save
        redirect_to images_path, notice: 'Image uploaded successfully.'
      else
        flash.now[:alert] = 'Failed to upload image.'
        render :new
      end
  end

  def destroy
    @image = current_user.images.find(params[:id])
    @image.destroy
    redirect_to images_path
  end

  private

  def image_params
    params.require(:image).permit(:file)
  end
end
