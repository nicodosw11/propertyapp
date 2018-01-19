User.create!(first_name:  "Admin",
             last_name:  "User",
             email: "admin@propertyapp.org",
             password:              "Foobar123",
             password_confirmation: "Foobar123",
             admin:     true,
             confirmed_at: Time.zone.now)
