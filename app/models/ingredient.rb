class Ingredient<ApplicationRecord
    validates :name, presence: true,length: {minimum: 3,maximum: 30}
    validates_uniqueness_of :name
    has_many :recipes_ingredients
    has_many :recipes through: recipes_ingredients
end
