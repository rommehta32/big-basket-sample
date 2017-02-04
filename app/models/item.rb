class Item < ActiveRecord::Base
  validates :name, :unit_price, :quantity, :updated_by, :presence => true
  validates_uniqueness_of :name
  validates_numericality_of :unit_price, message: " is not valid."

  belongs_to :administrator, foreign_key: :updated_by
end
