User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)


Genre.create!(name:  "Sci-Fi")
Genre.create!(name:  "Drama")
Genre.create!(name:  "Thriller")
