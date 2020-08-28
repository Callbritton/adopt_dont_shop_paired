class Favorite
 attr_reader :favorites
  def initialize(initial_contents)
    @favorites = initial_contents
  end

  def total_count
    @favorites.count
  end

end
