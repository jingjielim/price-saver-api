class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :editable

  def editable
    scope == object.user
  end
end
