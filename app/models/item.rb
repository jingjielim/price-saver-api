class Item < ApplicationRecord
  belongs_to :user
  validates :name, :user, presence: true
end
