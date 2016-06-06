class Cocktail < ActiveRecord::Base
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  # validates_presence_of :name
  validates :name, uniqueness: true, presence: true
  mount_uploader :image, PhotoUploader
end
