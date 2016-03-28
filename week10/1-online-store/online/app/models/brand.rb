class Brand < ActiveRecord::Base
  validates :name, presence: true
  validates :info, presence: true

  has_many :products
end
