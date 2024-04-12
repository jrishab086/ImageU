class ImagesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index]
  def index
    @images = current_user.images.paginate(page: params[:page], per_page: 3)
  end
  def new
    @image = current_user.images.build
  end
  def show
  @image = Image.find(params[:id])
  end

  def create
    @image = current_user.images.new(image_params)
      if @image.save
        redirect_to new_image_path, notice: 'Image uploaded successfully.'
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
  def after_registration_path

  end
  private

  def image_params
    params.require(:image).permit(:file)
  end
end
