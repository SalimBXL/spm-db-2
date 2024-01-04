# SUP Controller
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  layout :set_layout

  private

  def set_layout
    if current_user&.admin?
      'admin'
    else
      'application'
    end
  end
end
