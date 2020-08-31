class FavoritesController < ApplicationController

  def update
    pet = Pet.find(params[:pet_id])
    favorites = Favorite.new(session[:favorites])
    favorites.add_pet(pet)
    session[:favorites] = favorites.contents
    flash[:notice] = "You have added #{pet.name} to your favorites"
    redirect_to "/pets/#{pet.id}"
  end

  def index
    favorites
  end

  def destroy
    pet = Pet.find(params[:pet_id])
    favorites.destroy_pet(pet.id)
    flash[:notice] = "You have removed #{pet.name} from your favorites"
    redirect_to "/pets/#{pet.id}"
  end

  def destroy_all
    favorites.destroy_all_pets
    redirect_to "/favorites"
  end

end
