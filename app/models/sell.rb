class Sell < ApplicationRecord
  include Fae::BaseModelConcern
  belongs_to :discount
  belongs_to :client
  validates :client, presence: true
  enum status: { finished:0, cancelled: 1 }
 
  def fae_display_field
    id
  end

  def self.for_fae_index
    order(:id)
  end
  
end
