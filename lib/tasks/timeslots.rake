namespace :timeslots do
  desc "Update status everyday for each auction"
  task update_status: :environment do
    Timeslot.all.each do |timeslot|
      if timeslot.auction_start > Date.today
        timeslot.status = "pending"
      elsif timeslot.auction_end < Date.today
        timeslot.status = "end"
      else 
        timeslot.status = "live"
      end
      timeslot.save
    end

    puts "auction statuses updated at #{Date.today}"
  end

end
