class Order < ApplicationRecord
  belongs_to :user

  serialize :products
end
