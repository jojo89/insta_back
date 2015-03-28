class LocationAggregator
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def get_locations
     Instagram.media_search(latitude, longitude, {radius: 4500, count: 11}).map do |instagram|
      Location.create(instagram_identifier: instagram.id.to_s, latitude: instagram.latitude.to_s, longitude: instagram.longitude.to_s, name: instagram.name)
    end
  end
end
