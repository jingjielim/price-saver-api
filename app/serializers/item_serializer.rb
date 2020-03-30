class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :unit, :editable
  has_many :prices

  def editable
    scope == object.user
  end
end
