# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

street_name = [
  "No.12, Sec. 1, Lixing Rd., Sanchong Dist., New Taipei City 241, Taiwan", 
  "No.12, Sec. 2, Lixing Rd., Sanchong Dist., New Taipei City 241, Taiwan",
  "No.12, Sec. 1, Lixing Rd., Sanchong Dist., New Taipei City 241, Taiwan",
  "No.12, Sec. 1, Sanhe Rd., Sanchong Dist., New Taipei City 241, Taiwan",
  "No.12, Sec. 2, Sanhe Rd., Sanchong Dist., New Taipei City 241, Taiwan",
  "No.12, Sec. 3, Sanhe Rd., Sanchong Dist., New Taipei City 241, Taiwan",
  "No.12, Sec. 4, Sanhe Rd., Sanchong Dist., New Taipei City 241, Taiwan",
  "No.12, Datong N. Rd., Sanchong Dist., New Taipei City 241, Taiwan",
  "No.55, Datong N. Rd., Sanchong Dist., New Taipei City 241, Taiwan",
  "No.88, Datong N. Rd., Sanchong Dist., New Taipei City 241, Taiwan",
  "No.12, Sec. 1, Yong’an N. Rd., Sanchong Dist., New Taipei City 241, Taiwan ",
  "No.12, Sec. 2, Yong’an N. Rd., Sanchong Dist., New Taipei City 241, Taiwan ",
  "No.12, Sec. 1, Guangfu Rd., Sanchong Dist., New Taipei City 241, Taiwan",
  "No.12, Sec. 2, Guangfu Rd., Sanchong Dist., New Taipei City 241, Taiwan",
  "No.12, Sec. 1, Ziqiang Rd., Sanchong Dist., New Taipei City 241, Taiwan",
  "No.12, Sec. 2, Ziqiang Rd., Sanchong Dist., New Taipei City 241, Taiwan",
  "No.12, Sec. 3, Ziqiang Rd., Sanchong Dist., New Taipei City 241, Taiwan"
]

# descriptions = [
#   "Bacon ipsum dolor amet salami shoulder short ribs short loin. Boudin beef drumstick, pork belly beef ribs pork meatball ham andouille. Pork tail sausage chicken venison. Landjaeger shoulder swine short ribs beef ribs alcatra.", 
#   "Kielbasa hamburger burgdoggen, pork loin bresaola buffalo turkey shoulder picanha kevin. Tongue tri-tip cow kevin fatback strip steak capicola. Biltong doner leberkas shoulder short ribs corned beef porchetta. Ribeye short loin doner burgdoggen capicola chuck spare ribs flank. Kevin spare ribs prosciutto ball tip buffalo cow. Leberkas cupim chicken beef ribs. Sirloin pork andouille spare ribs venison.",
#   "Shoulder fatback prosciutto, tail ground round porchetta andouille ribeye. Strip steak bacon bresaola pig, capicola short ribs hamburger burgdoggen pork boudin turkey ribeye. Sirloin hamburger alcatra, spare ribs pig chicken landjaeger. Ball tip t-bone short loin meatloaf pork chop. Corned beef t-bone landjaeger ball tip pig, strip steak kielbasa drumstick porchetta brisket short loin pork chop meatloaf. Alcatra beef kevin venison drumstick, brisket pork loin salami landjaeger picanha buffalo.",
#   "Tongue meatball andouille shank. Tenderloin andouille pastrami, ground round ribeye burgdoggen flank ham hock porchetta ball tip biltong strip steak. Capicola leberkas beef ribs doner bresaola porchetta shank filet mignon sausage tail pork loin. Chicken burgdoggen bacon tri-tip beef. Jerky t-bone tri-tip jowl flank ground round salami sausage pork belly.",
#   "Pork chop capicola pork loin rump tri-tip doner chicken. Pork corned beef chicken meatball jerky. Tenderloin bresaola fatback, tri-tip filet mignon kevin rump shank jowl andouille leberkas pork chop porchetta. Kevin pork loin biltong venison pork shankle bacon tail short ribs. Short loin kevin t-bone, leberkas landjaeger pork loin short ribs bacon brisket corned beef chicken filet mignon cow porchetta.", 
#   "Does your lorem ipsum text long for something a little meatier? Give our generator a try… it’s tasty!"
# ]

# def image_rand
#   number = (1..6).to_a
#   image_data = File.open(Rails.root+ "app/assets/images/#{number.sample}.jpg")
# end

# 30.times do |t|
#   Board.create(
#     title: "billboard#{t}",
#     description: descriptions.sample,
#     location: street_name.sample,
#     current_price: rand(1..10)*100,
#     user_id: User.all.sample.id,
#     images: [image_rand]
#   )
# end





# Board.all.each do |board|

#   board.images = [image_rand]
#   # listing[:image].push(image_data)
#   board.save
# end

# user = User.find(10)

# boards = user.boards

# 1.times do |t|
#   Board.all.each do |board|
#     board.timeslots.create(start_date: Date.today, end_date: Date.today, current_price: rand(1..10)*100)
#   end

# end

# Board.all.each do |board|
#   board.location = street_name.sample
#   board.save
# end

number = (-10..10).to_a

Timeslot.all.each do |timeslot|
  timeslot.auction_start = Date.today + number.sample
  timeslot.save
end