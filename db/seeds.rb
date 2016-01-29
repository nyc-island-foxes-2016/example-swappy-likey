# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u1 = User.create!(name:'steven', email:'steven@example.com', password:'1234567')
u2 = User.create!(name:'jim', email:'jim@example.com', password:'1234567')

i1 = u1.items.create!(name: 'AAAAA')
i2 = u1.items.create!(name: 'BBBBB')
i3 = u1.items.create!(name: 'CCCCC')

i4 = u2.items.create!(name: 'XXXXX')
i5 = u2.items.create!(name: 'YYYYY')
i6 = u2.items.create!(name: 'ZZZZZ')

i1.given_swipes.create(judged_item: i5, direction_like: true)
i5.given_swipes.create(judged_item: i1, direction_like: true)
i5.given_swipes.create(judged_item: i2, direction_like: true)
i2.given_swipes.create(judged_item: i6, direction_like: false)
i3.given_swipes.create(judged_item: i4, direction_like: true)
