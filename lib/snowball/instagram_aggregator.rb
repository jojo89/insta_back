class InstagramAggregator
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def get_instagram_photos
    Instagram.media_search(latitude, longitude, {radius: 4500, count: 11}).map do |instagram|
      caption = instagram.caption ? instagram.caption.text : nil
      gram = InstagramPhoto.create(latitude: instagram["location"]["latitude"], longitude: instagram["location"]["longitude"], username: instagram.user.username, url: instagram.images.standard_resolution.url, description: caption)
      puts gram.description
    end
  end
end
