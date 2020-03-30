# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :examples
  has_many :items, dependent: :destroy
  has_many :stores, dependent: :destroy
end
