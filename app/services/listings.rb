class Listings

require 'json'

  CHECKOUT = %w{fisrt_checkin last_checkout checkout_checkin}.freeze

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
        price = list.num_rooms.to_i * 10
        list.missions.create(mission_type: CHECKOUT[0], date: booking['start_date'], price: price )
        list.missions.create(mission_type: CHECKOUT[1], date: booking['end_date'], price: price )
      end
      data_hash['reservations'].each do |reservation|
        listg = Listing.find(reservation['listing_id'])
        listg.reservations.create(start_date: reservation['start_date'], end_date: reservation['end_date'])
        last_date = Mission.where(listing_id: reservation['listing_id'], mission_type: CHECKOUT[1]).last.date
        if reservation['end_date'] < last_date
          price = listg.num_rooms.to_i * 5
          listg.missions.create(mission_type: CHECKOUT[2], date: reservation['end_date'], price: price )
        end
      end
      data_hash
    end
end
