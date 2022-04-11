class HomeController < ApplicationController
  def index
    user_signed_in? ? redirect_to(items_path) : render
  end
end
