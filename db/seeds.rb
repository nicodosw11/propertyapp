User.create!(first_name:  "Admin",
             last_name:  "User",
             email: "admin@propertyapp.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             confirmed_at: Time.zone.now)
