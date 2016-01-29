# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u1 = User.create!(name:'steven', email:'steven@example.com', password:'1234567')
u2 = User.create!(name:'jim', email:'jim@example.com', password:'1234567')

i11 = u1.items.create!(name: 'AAAAA')
i12 = u1.items.create!(name: 'BBBBB')
i13 = u1.items.create!(name: 'CCCCC')

i21 = u2.items.create!(name: 'XXXXX')
i22 = u2.items.create!(name: 'YYYYY')
i23 = u2.items.create!(name: 'ZZZZZ')

i11.given_swipes.create(judged_item: i22, direction_like: true)
i22.given_swipes.create(judged_item: i11, direction_like: true)
i11.given_swipes.create(judged_item: i23, direction_like: true)
i22.given_swipes.create(judged_item: i13, direction_like: false)

