class Price < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :store
end
