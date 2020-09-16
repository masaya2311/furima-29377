class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :area
  belongs_to_active_hash :delivery_time

  validates :name, :explanation, :image,  presence: true

  validates :category_id, numericality: { other_than: 0 }
  validates :condition_id, numericality: { other_than: 0 }
  validates :postage_id, numericality: { other_than: 0 }
  validates :area_id, numericality: { other_than: 0 }
  validates :delivery_time_id, numericality: { other_than: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
end
