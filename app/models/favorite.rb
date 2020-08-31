class Favorite
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Array.new
  end

  def add_pet(pet)
    @contents << pet.id
  end

  def total_count
    @contents.count
  end

  def pets_by_id
    @contents.collect do |id|
      Pet.find(id)
    end
  end

  def destroy_pet(pet)
    @contents.delete(pet)
  end

  def contents_are_empty?
    total_count == 0
  end

  def destroy_all_pets
    @contents.clear
  end

end
