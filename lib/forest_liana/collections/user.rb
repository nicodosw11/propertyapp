class Forest::User
  include ForestLiana::Collection

  collection :User

  field :fullname, type: 'String' do
    "#{object.first_name} #{object.last_name}"
  end
end
