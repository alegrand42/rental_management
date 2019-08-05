FactoryBot.define do
  factory :mission do
    date { '2016-10-10' }    
    price { 20 }    
    missing_type { 'first_checkin' }    
  end
end
