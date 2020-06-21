# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
    Test.create(
        name: Faker::Book.title,
        content: Faker::Lorem.paragraph_by_chars(number: 525, supplemental: false)
    )
end

20.times do
    Score.create(
        wpm: rand(30..80),
        test_id: Test.all.map {|t| t.id}.sample
    )
end