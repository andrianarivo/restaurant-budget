class SplashscreenController < ApplicationController
  def index
    redirect_to restaurants_path if user_signed_in?
  end
end
