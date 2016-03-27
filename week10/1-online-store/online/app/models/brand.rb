class Brand < ActiveRecord::Base
  validates :name, presence: true
  validates :info, presence: true
end
