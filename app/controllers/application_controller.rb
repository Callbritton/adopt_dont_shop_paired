class ApplicationController < ActionController::Base
  helper_method :favorites, :pets_with_applications

  def favorites
    @favorites ||= Favorite.new(session[:favorites])
  end

  def pets_with_applications
    @pets = Pet.all
    @pets_w_app = @pets.find_all do |pet|
      if pet.pet_applications.count > 0
        pet
      end
    end
  end
end
