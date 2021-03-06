# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning data base weddings"
Wedding.destroy_all

puts "Cleaning data base users"
User.destroy_all

puts "Création des 3 users"


new_user_polo = User.create({
    first_name: "Paul",
    last_name: "de Bodi",
    email: "polo@bodi.fr",
    password: "333333",
    password_confirmation: "333333",
    avatar_url: "https://avatars3.githubusercontent.com/u/32060402?s=460&v=4"
    })

new_user_aurel = User.create({
    first_name: "Aurelie",
    last_name: "Dubs",
    email: "aure@lie.fr",
    password: "222222",
    password_confirmation: "222222",
    avatar_url: "https://avatars0.githubusercontent.com/u/32846131?s=400&v=4"
    })

new_user_horti = User.create({
    first_name: "Hortense",
    last_name: "Martin",
    email: "hor@titi.fr",
    password: "111111",
    password_confirmation: "111111",
    avatar_url: "https://avatars0.githubusercontent.com/u/32671308?s=400&v=4"
    })

puts "id horti : #{new_user_horti.id}"
puts "id aurelie : #{new_user_aurel.id}"
puts "id polo : #{new_user_polo.id}"

puts "Créations de 2 mariages maintenant"


wedding_polo = Wedding.create({
  title: "French : collaboratif",
  description: "Mariage collaboratif en Bourgogne, au milieu des vigne de chablis. Venez passer avec nous les 3 jours du week-end de la Pentecôte. Venez vous associer à la joie de note engagement. On compte sur vous!",
  capacity: 51,
  user_id: new_user_polo.id,
  date: Date.new(2018, 5, 19),
  location: "Abbaye de Pontigny",
  photo_url: "https://www.le-pigeonnier-colbert.fr/wp-content/uploads/Abbaye-de-Pontigny-1040x559.jpg",
  spouse_photo_url: "https://avatars1.githubusercontent.com/u/32060402?s=400&u=33d0f8f8d6ac9979437727646e169c3173784a42&v=4",
  spouse_first_name: "Odile",
  spouse_last_name: "Monseu"
  })

wedding_horti = Wedding.create({
  title: "Lightful",
  description: "Let's get married like Louis XIV",
  capacity: 78,
  user_id: new_user_horti.id,
  date: Date.new(2017,2,14),
  location: "Versailles",
  photo_url: "http://www.chateauversailles-spectacles.fr/sites/default/files/styles/largeur_page/public/en-tete-site-festival2016-nuits-orangerie-version.jpg?itok=Zkq2UlQd",
  spouse_photo_url: "https://avatars0.githubusercontent.com/u/32671308?s=400&v=4",
  spouse_first_name: "Ben",
  spouse_last_name: "Brion"
  })


wedding_aurel = Wedding.create({
  title: "Trinquons !",
  description: "Parce que la vie, c'est la joie.",
  capacity: 132,
  user_id: new_user_aurel.id,
  date: Date.new(2018,12,31),
  location: "Valence, France",
  photo_url: "https://www.theknot.com/assets/topic_pages/wedding-vows-ceremony-de390170d87b481e073afef3e03a2c7b4a5d7e0b1de1036a40816f80fa85a6cd.jpg",
  spouse_photo_url: "https://avatars0.githubusercontent.com/u/32846131?s=400&v=4",
  spouse_first_name: "Sylvain",
  spouse_last_name: "Chêne"
  })

# puts "Création de 6 messages"

# Message.create!(
#   sender: new_user_polo,
#   receiver: new_user_aurel,
#   title: 'I want to come',
#   content: 'Hi Aurel, could I participate to your wedding?'
# )

# Message.create!(
#   sender: new_user_aurel,
#   receiver: new_user_polo,
#   title: 'RE: I want to come',
#   content: 'Hi Polo, of course ! You are welcome',
# )

# Message.create!(
#   sender: new_user_polo,
#   receiver: new_user_aurel,
#   title: 'RE: I want to come',
#   content: 'Thank you so much :) '
# )

# Message.create!(
#   sender: new_user_polo,
#   receiver: new_user_horti,
#   title: 'I want to come',
#   content: 'Hi Aurel, could I participate to your wedding?'
# )

# Message.create!(
#   sender: new_user_horti,
#   receiver: new_user_polo,
#   title: 'RE: I want to come',
#   content: 'Hi Polo, of course ! You are welcome',
# )

# Message.create!(
#   sender: new_user_polo,
#   receiver: new_user_horti,
#   title: 'RE: I want to come',
#   content: 'Thank you so much :) '
# )

# Message.create!(
#   sender: new_user_aurel,
#   receiver: new_user_horti,
#   title: 'Wedding together?',
#   content: 'Hello, can I come?'
# )

# Message.create!(
#   sender: new_user_horti,
#   receiver: new_user_aurel,
#   title: 'RE: Wedding together?',
#   content: 'Yes!',
# )


puts "seed done !"
