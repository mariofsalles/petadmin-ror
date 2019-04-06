class Sell < ApplicationRecord

  include Fae::BaseModelConcern
  before_save :set_total

  enum status: { finished:0, cancelled: 1 }
  validates :client, presence: true

  belongs_to :discount
  belongs_to :client

  has_many :sell_products, dependent: :destroy
  has_many :products, through: :sell_products
  
  has_many :sell_services, dependent: :destroy
  has_many :services, through: :sell_services

  def fae_display_field
    id
  end

  def self.for_fae_index
    order(:id)
  end
  
  private
  def set_total
    total = 0
    self.products.each {|p| total += p.price }
    self.services.each {|s| total += s.price }

    if self.discount.present?
      total -= self.discount.value
    end

    total = (total >= 0)? total : 0
    self.total = total
  end 
end
