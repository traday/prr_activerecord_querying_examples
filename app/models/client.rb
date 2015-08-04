class Client < ActiveRecord::Base
  validates :name, presence: true
  has_one :address
  has_many :orders
  has_and_belongs_to_many :roles
end


