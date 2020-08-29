class ApplicationController < ActionController::Base
  helper_method :favorites

  def favorites
    @favorites ||= Favorite.new(session[:favorites])
  end
end
