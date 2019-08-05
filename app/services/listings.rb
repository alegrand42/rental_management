class Listings

require 'json'

    def self.gather_data
      file = File.read('public/backend_test.rb')
      file.slice! "input = "
      data_hash = JSON.parse(file)
      data_hash['listings'].each do |listing|
        Listing.find_or_create_by(id: listing['id'], num_rooms: listing['num_rooms'])
      end
      data_hash['bookings'].each do |booking|
        list = Listing.find(booking['listing_id'])
        list.bookings.create(start_date: booking['start_date'], end_date: booking['end_date'])
      end
      data_hash['reservations'].each do |reservation|
        list = Listing.find(reservation['listing_id'])
        list.reservations.create(start_date: reservation['start_date'], end_date: reservation['end_date'])
      end
      data_hash
    end
end
