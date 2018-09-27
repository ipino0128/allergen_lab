class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  has_many :allergies
  has_many :users, through: :allergies

  def self.ranked_allergies
    ranked = Ingredient.all.sort_by do |ing|
      ing.allergies.count
    end
    ranked.reverse
  end

end
