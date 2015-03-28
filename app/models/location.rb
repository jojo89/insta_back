class Location
  include Mongoid::Document
  field :instagram_identifier, type: Integer
  field :latitude, type: Integer
  field :longitude, type: Integer
  field :name, type: String
  embeds_many :instagram_photos
end
