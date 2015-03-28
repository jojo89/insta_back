class InstagramPhoto
  include Mongoid::Document
  field :username, type: String
  field :url, type: String
  field :description, type: String
  field :latitude, type: String
  field :longitude, type: String
end
