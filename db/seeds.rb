# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
# Clothings.create(
# classification:"shoes",
# brand:"nike ",
# name:"Air+Max+DN8",
#  price:"189.99",
# material:"leatherette",
# size:"35-45",
# description:"More Air, less volume. The Dn8 takes over our Dynamic Air system and condenses it into a low, clean shoe. With its eight pressurized Air tubes, it offers a sensation of responsiveness at each step. Live an incredible movement experience.",
# image_url: "/images/clothings/shoes/air_max_dn8.jpg",
#  #for_whom: "unisex"
# )
# Clothings.create(
# classification:"shoes",
# brand:"nike ",
# name:"Air Jordan 4 RM",
# price:"149.99",
# material:"leatherette",
# size:"33-43",
# description:"The remix you needed. Ideal for switching from one activity to another, this sneaker reinvents the AJ4 with an emphasis on comfort and strength. The Max Air cushioning is ultra-comfortable. And parts of the vamp were also integrated into a strong, flexible cage that wraps the shoe. As a result, it is more resistant to everyday wear and tear.",
# image_url: "/images/clothings/shoes/air_jordan_4_rm.jpg",
# for_whom: "for_women"
# )
# Clothings.create(
# classification:"shoes",
# brand:"adidas ",
#  name:"Men Samba OG Collegiate ",
# price:"120",
# material:"leatherette",
# size:"35-45",
# description:"",
# image_url: "/images/clothings/shoes/men_samba_og_collegiate.jpg",
# for_whom: "for_men"
# )
Clothings.create(
  classification: "t-shirts",
  brand: "underarmour. ",
  name: "Polo UA Matchplay  ",
  price: "40",
  material: "94 % polyester / 6 % élasthanne",
  size: "XL,M,L",
  description: "",
  image_url: "/images/clothings/t-shirts/polo_ua_matchplay.jpg",
  for_whom: "for_men"
)
Clothings.create(
  classification: "t-shirts",
  brand: "underarmour. ",
  name: "Polo UA Matchplay  ",
  price: "40",
  material: "94 % polyester / 6 % élasthanne",
  size: "XL,M,L",
  description: "",
  image_url: "/images/clothings/t-shirts/polo_ua_matchplay.jpg",
  for_whom: "for_men"
)
