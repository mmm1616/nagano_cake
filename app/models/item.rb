class Item < ApplicationRecord
    
    has_one_attached :image
    belongs_to :genre
    belongs_to :homes
    has_many :cart_items
    has_many :order_details
    
    validates :image, presence: true
    
end
