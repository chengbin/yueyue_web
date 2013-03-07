class Event::Karaoke < ActiveRecord::Base
  attr_accessible :describe, :paytype, :people_number_max, :people_number_min, :per_pay, :place, :start_time, :status, :title
end
