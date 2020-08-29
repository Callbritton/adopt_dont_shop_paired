class Favorite
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Array.new
  end

  def add_pet(pet)
    @contents << pet
  end

  def total_count
    @contents.count
    # require "pry"; binding.pry
    # if @contents.class == Array
    #   @contents.count
    # else
    #   @contents.count
    # end
  end

end
