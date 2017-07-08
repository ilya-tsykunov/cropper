FactoryGirl.define do
  factory Event do
    name 'Event'
    start_date '2017-07-05 21:01:00'
    end_date '2017-07-05 21:02:00'
    city 'City'
    topics { [create(:topic)] }
  end
end
