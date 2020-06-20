class HomeController < ApplicationController
  def top
    redirect_to home_path if user_signed_in?
  end
end