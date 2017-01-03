User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "password",
             password_confirmation: "password",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
             

User.create!(name:  "Example User2",
             email: "example2@railstutorial.org",
             password:              "password",
             password_confirmation: "password",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

Genre.create!(name:  "Sci - Fi")
Genre.create!(name:  "Thriller")
Genre.create!(name:  "Drama")