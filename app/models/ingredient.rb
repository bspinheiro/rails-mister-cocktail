class Ingredient < ApplicationRecord
  has_many :doses

  validates :name, uniqueness: true, presence: true
  before_destroy :check_doses

  private

  def check_doses
    errors.add(:base, 'Cannot delete ingredient with related doses') if doses.any?
    return false
  end
end
