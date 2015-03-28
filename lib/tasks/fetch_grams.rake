namespace :aggregate do
  desc 'Fetch data from Instagram'
  task :instagrams, [:latitude, :longitude] => :environment do |t, args|
    query_points(args[:latitude].to_i, args[:longitude].to_i).each do |array|
      locations = InstagramAggregator.new(array[0], array[1]).get_instagram_photos
    end
  end

  def query_points(latitude, longitude)
    array = []
    5.times do |lat|
      5.times do |lng|
        array << [latitude + lat, longitude - lng]
        array << [latitude - lat, longitude + lng]
        array << [latitude - lat, longitude - lng]
        array << [latitude + lat, longitude + lng]
      end
    end
    array
  end
end
