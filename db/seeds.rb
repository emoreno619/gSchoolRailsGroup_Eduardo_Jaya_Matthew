# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create(email:'3moreno.eduardo@gmail.com', password:'secret')
u2 = User.create(email:'test@example.com', password:'secret')

l1 = Location.create(name:'Best Organics', address:'123 Main St. Anytown, USA', phone:'123-456-8971', gluten_free: true, vegan: true, image_url: 'http://allisonmaruska.files.wordpress.com/2012/06/60bd2-cartoon-grocerystore.jpg')
l2 = Location.create(name:'Flesh and Gluten 4 Life', address:'123 Your Worst Nightmare, USA', phone:'432-109-8801', gluten_free: false, vegan: false, image_url: 'http://freefromharm.org/wp-content/uploads/2013/03/rocky_slaughterhouse.jpg')

u1.locations << l1
u2.locations << l2

f1 = Food.create(name:'Happy Cheese', gluten_free:false, vegan:true, image_url:'http://www.addictedtosaving.com/wp-content/uploads/2012/05/free85.jpg')
f2 = Food.create(name:'Meat of Sadness', gluten_free:true, vegan:false, image_url:'http://previews.123rf.com/images/artenot/artenot1111/artenot111100141/11168758-funny-cartoon-cow-Stock-Vector-cow-crying-sad.jpg')

l1.foods << f1
l2.foods << f2

u1.foods << f1
u2.foods << f2