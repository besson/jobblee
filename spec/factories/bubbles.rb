FactoryGirl.define do
  factory :bubble do 
    name "Software Engineer"
    location Location.new(state: "CA", latitude: 36.17, longitude: -119.7462)
  end
end
