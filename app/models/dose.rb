class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :cocktail_id, uniqueness: { scope: :ingredient_id }

  def to_label
    "#{description} - #{ingredient.name}"
  end

end
