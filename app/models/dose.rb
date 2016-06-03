class Dose < ActiveRecord::Base
  belongs_to :cocktail
  belongs_to :ingredient
  # has_many :ingredients
  validates :cocktail, presence: true
  validates :amount, presence: true
  validates :description, presence: true
  validates :ingredients, presence: true, uniqueness: { scope: [:cocktail, :ingredient]}
    # belongs_to :ingredient
    # belongs_to :cocktail
  #  validates :description, presence: true
  #  validates :ingredient, presence: true, :uniqueness => true
  #  validates :cocktail, presence: true, :uniqueness => true
  #  belongs_to :cocktail
  #  belongs_to :ingredient
end
