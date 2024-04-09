class HomeController < ApplicationController

  def index
  end
skip_before_action :authenticate_user!
  def after_registration_path

  end
end
