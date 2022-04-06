class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]

  def after_sign_up_path_for
    about_path
  end
end
