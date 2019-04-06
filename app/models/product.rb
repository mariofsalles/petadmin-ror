class Product < ApplicationRecord
  include Fae::BaseModelConcern
  
  validates :title, uniqueness: true, presence: true
  validates :price, presence: true

  has_fae_image :hero_image
  belongs_to :supplier
  
  def fae_display_field
    title
  end
  
end
