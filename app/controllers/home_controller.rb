# HOME Controller
class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @lasts = Spm.last(8).reverse
  end
end
