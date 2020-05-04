# rails db:seed
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  Task.create!(title: 'title1', text: 'text 1', tag: :urgent, done: :false, expire_on: DateTime.new(2020, 5, 11, 17) )
  Task.create!(title: 'title2', text: 'text 2', tag: :important, done: :true, expire_on: DateTime.new(2020, 5, 11, 17) )
  Task.create!(title: 'title3', tag: :postponed, done: :false, expire_on: DateTime.new(2020, 5, 11, 17) )
  Task.create!(title: 'title4', text: 'text 4', done: :true, expire_on: DateTime.new(2020, 5, 11, 17) )
  Task.create!(title: 'title5', tag: :urgent, expire_on: DateTime.new(2020, 5, 11, 17) )
end