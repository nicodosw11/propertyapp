FactoryGirl.define do
  factory :deal do
    street "3 rue des peupliers"
    city "Chatou"
    district "Yvelines"
    postcode "78400"
    property_type "Appartement"
    occupancy "Viager occupé"
    surface 105
    nb_bedrooms 2
    nb_bathrooms 1
  end
end
