# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

business1 = Card.create([phone_number: '1234567890', business_name: 'Walgreens', points: 1000])
business2 = Card.create([phone_number: '1234567890', business_name: 'CVS', points: 2000])
