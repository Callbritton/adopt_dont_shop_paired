require 'rails_helper'

RSpec.describe Favorite do
  describe "#total_count" do
    it 'can calculate the total number of favorited pets' do
      favorite = Favorite.new(["1", "234"])
      expect(favorite.total_count).to eq(2)
    end
  end
end
