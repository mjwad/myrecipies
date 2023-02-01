require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @recipe=Recipe.new(name: "vegatable",description: "great vegatable")
  end

  test "Recipie should be valid" do
    assert @recipe.valid?
  end
  test "Recipie name check" do
    assert_not @recipe.valid?
  end
end
