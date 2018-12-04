class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :contact, :address, :city, :postalCode, :long, :lat, :count, :image

  def image
    url_for(object.image) if object.image.attached?
  end

  def count
    object.hits
  end
end
