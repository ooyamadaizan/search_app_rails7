class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  
  with_options presence: true do
    validates :image
    validates :name
    validates :price
  end

  validates :category_id, numericality: { greater_than_or_equal_to:1 ,less_than_or_equal_to:10, message: "is invalid" }

  def self.ransackable_attributes(auth_object = nil)
    ["name", "price", "category_id"]
  end
  
  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end

end
