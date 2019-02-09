# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?

  # create test-user
  password = "TestPW234!"
  user = User.create!(
                       {
                          email: "test@test.net",
                          password: password,
                          password_confirmation: password,
                       }
                     )

  start_year = 2000
  end_year = 2019
  (start_year..end_year).each do |year|
      (1..12).each do |month|
        now = Time.current
        starttime = Time.new(now.year, now.month, now.day, 9, 0, 0)
        endtime = starttime.advance(hours: 8, minutes: 45)
        (1..Time.days_in_month(month, year)).each do |day|
            TimeEntry.create!({
                                date: Date.new(year, month, day),
                                start: starttime,
                                end: endtime,
                                breaks: Time.new(now.year, now.month, now.day, 0, 45, 0),
                                user_id: user.id,
                            })
          end
      end
  end



end
