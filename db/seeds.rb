# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create(email:'3moreno.eduardo@gmail.com', password:'secret')
u2 = User.create(email:'test@example.com', password:'secret')

l1 = Location.create(name:'Whole Foods', address:'399 4th Street, San Francisco, CA 94107', phone:'415-618-0066', gluten_free: true, vegan:true, image_url:'http://vertassets.blob.core.windows.net/image/fba53805/fba53805-7022-481b-94d0-1217d328f50d/whole_foods_logo.jpg')
l2 = Location.create(name:'Whole Foods', address:'1765 California St. San Francisco, CA 94109', phone:'415-674-0500', gluten_free: true, vegan:true, image_url:'http://vertassets.blob.core.windows.net/image/fba53805/fba53805-7022-481b-94d0-1217d328f50d/whole_foods_logo.jpg')
l3 = Location.create(name:'Whole Foods', address:'450 Rhode Island Street, San Francisco, CA 94107', phone:'415-522-1155', gluten_free: true, vegan:true, image_url:'http://vertassets.blob.core.windows.net/image/fba53805/fba53805-7022-481b-94d0-1217d328f50d/whole_foods_logo.jpg')
l4 = Location.create(name:'Whole Foods', address:'2001 Market Street, San Francisco, CA 94114', phone:'415-626-1430', gluten_free: true, vegan:true, image_url:'http://vertassets.blob.core.windows.net/image/fba53805/fba53805-7022-481b-94d0-1217d328f50d/whole_foods_logo.jpg')
l5 = Location.create(name:'Whole Foods', address:'3950 24th Street, San Francisco, CA 94114', phone:'415-282-4700', gluten_free: true, vegan:true, image_url:'http://vertassets.blob.core.windows.net/image/fba53805/fba53805-7022-481b-94d0-1217d328f50d/whole_foods_logo.jpg')
l6 = Location.create(name:'Whole Foods', address:'690 Staynan Street, San Francisco, CA 94117', phone:'415-876-6740', gluten_free: true, vegan:true, image_url:'http://vertassets.blob.core.windows.net/image/fba53805/fba53805-7022-481b-94d0-1217d328f50d/whole_foods_logo.jpg')
l7 = Location.create(name:'Whole Foods', address:'1150 Ocean Avenue San Francisco, CA 94112', phone:'415-333-7400', gluten_free: true, vegan:true, image_url:'http://vertassets.blob.core.windows.net/image/fba53805/fba53805-7022-481b-94d0-1217d328f50d/whole_foods_logo.jpg')

f1 = Food.create(name:'So Delicious', gluten_free:true, vegan:true, image_url:'http://www.cybelepascal.com/wp-content/uploads/2012/05/427733_324035217640883_138769756167431_1040546_153981307_n.jpg')
f2 = Food.create(name:'Field Roast', gluten_free:true, vegan:false, image_url:'http://www.chimpsanctuarynw.org/images/2013%20events/Field-Roast-logo-color.png')

u1.locations << l1
u2.locations << l4

u1.foods << f1
u2.foods << f1

l1.foods << f1
l2.foods << f1
l3.foods << f1
l4.foods << f2
l5.foods << f2
l6.foods << f2
l7.foods << f2







