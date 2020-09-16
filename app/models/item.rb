class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :area
  belongs_to_active_hash :delivery_time

  validates :name, :explanation, :price, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :postage_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 1 }
  validates :delivery_time_id, numericality: { other_than: 1 }

end
