# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@guest1 = Guest.create({name: 'David', email: 'david.olem@gmail.com', departure_city: 'San Francisco'})
@guest2 = Guest.create({name: 'Michael', email: 'mtorres253@gmail.com', departure_city: 'Chicago'})
Shortener::ShortenedUrl.generate("http://www.davidandmichael.com/?eeid=#{CGI::escape(@guest1.email_encrypted)}", @guest1)
Shortener::ShortenedUrl.generate("http://www.davidandmichael.com/?eeid=#{CGI::escape(@guest2.email_encrypted)}", @guest2)

Response.create([{adults: '2', children: '1', guest_id: '1', comments: 'awesome', coming: true, friday_reception: true}])