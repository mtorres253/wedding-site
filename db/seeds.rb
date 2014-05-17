# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Guest.create([{name: 'David', email: 'david.olem@gmail.com'}, {name: 'Michael', email: 'mtorres253@gmail.com'}])
Response.create([{adults: '2', children: '1', guest_id: '1', comments: 'awesome'}])