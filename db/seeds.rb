Admin.create([{ first_name: "Admin_first",
                last_name: "Admin_last",
                email: "admin@email.com",
                password: "password"
                }])

User.create([{ first_name: "Alice",
               last_name: "alast_name",
               email: "alice@email.com",
               password: "password" },
             { first_name: "Bob",
               last_name: "blast_name",
               email: "bob@email.com",
               password: "password" },
             { first_name: "Carol",
               last_name: "clast_name",
               email: "carlo@email.com",
               password: "password" },
             { first_name: "Dave",
               last_name: "dlast_name",
               email: "dave@email.com",
               password: "password" },
             { first_name: "eve",
               last_name: "elast_name",
               email: "eve@email.com",
               password: "password"
               }])

categories = Category.create([{ name: "Denver" },
                              { name: "New York" },
                              { name: "Seattle" },
                              { name: "San Francisco" },
                              { name: "Washington"
                                }])

path = 'app/assets/images/'

#Denver -----------------------------------------------------------------
item1 = Item.new(title: "Denver B&B",
                 description: "Denver Omeletes and Canibus for everyone!",
                 price: 11000,
                 image: open(path + "ex_denver.jpg"))

item1.categories << categories[0]
item1.save

item2 = Item.new(title: "Denver Love Shack",
                 description: "Mile High Escape",
                 price: 7500,
                 image: open(path + "ex_denver.jpg"))

item2.categories << categories[0]
item2.save

item3 = Item.new(title: "Denver Mountain Retreat",
                 description: "The Air is thin up there, boil your eggs a couple minutes longer.",
                 price: 15000,
                 image: open(path + "ex_denver.jpg"))

item3.categories << categories[0]
item3.save

#New York --------------------------------------------------------------------
item4 = Item.new(title: "Big lights will inspire you",
                 description: "City so nice they named it twice",
                 price: 12000,
                 image: open(path + "ex_new_york.jpg"))

item4.categories << categories[1]
item4.save

item5 = Item.new(title: "Empire State of Mind",
                 description: "City so nice they named it thrice",
                 price: 11000,
                 image: open(path + "ex_new_york2.jpg"))

item5.categories << categories[1]
item5.save

item6 = Item.new(title: "These streets will make you feel brand new",
                 description: "City so nice they named it one-time",
                 price: 15000,
                 image: open(path + "ex_new_york.jpg"))

item6.categories << categories[1]
item6.save

#Seattles ----------------------------------------------------------------

item7 = Item.new(title: "Rain City, USA Condo",
                 description: "Cold, wet and smells like fish",
                 price: 10000,
                 image: open(path + "ex_seattle.jpg"))

item7.categories << categories[2]
item7.save

item8 = Item.new(title: "Pike Place Market Bungalo",
                 description: "Copper River Salmon!",
                 price: 15000,
                 image: open(path + "ex_seattle.jpg"))

item8.categories << categories[2]
item8.save

item9 = Item.new(title: "Mt Rainier Cabin",
                description: "If you like camping on a volcano, we have the place for you!",
                price: 8000,
                image: open(path + "ex_seattle.jpg"))

item9.categories << categories[2]
item9.save

# San Francisco-------------------------------------------------------------
item10 = Item.new(title: "Haight-Ashbury Hostel",
                  description: "Smells like teen hippies.",
                  price: 26000,
                  image: open(path + "ex_san_francisco.jpg"))

item10.categories << categories[3]
item10.save

item11 = Item.new(title: "Golden Gate Escape",
                  description: "aka Alcatraz",
                  price: 11000,
                  image: open(path + "ex_san_francisco.jpg"))

item11.categories << categories[3]
item11.save

item12 = Item.new(title: "Planet of the Apes Treehouse",
                  description: "We've got Apes!",
                  price: 14000,
                  image: open(path + "ex_san_francisco.jpg"))

item12.categories << categories[3]
item12.save


# Washington-----------------------------------------------------------
item13 = Item.new(title: "Condo on the Mall",
                  description: "Its not that kind of mall, dummy",
                  price: 16000,
                  image: open(path + "ex_washington_dc.jpg"))

item13.categories << categories[4]
item13.save

item14 = Item.new(title: "Capital Hill House",
                  description: "We like our politicians like we like our house, clean and liberal",
                  price: 11000,
                  image: open(path + "ex_washington_dc2.jpg"))

item14.categories << categories[4]
item14.save

item15 = Item.new(title: "Filibuster Flat",
                  description: "Perfet if you talk a lot",
                  price: 14000,
                  image: open(path + "ex_washington_dc.jpg"))

item15.categories << categories[4]
item15.save

item16 = Item.new(title: "Lincoln Bedroom",
                  description: "In the White Horse!",
                  price: 9000,
                  image: open(path + "ex_washington_dc.jpg"))

item16.categories << categories[4]
item16.save

item17 = Item.new(title: "Cherry Blossom B&B",
                  description: "Stay in on our luxurious lupaddlewheeler river boats on Tidal Basin",
                  price: 10000,
                  image: open(path + "ex_washington_dc.jpg"))

item17.categories << categories[4]
item17.save

item18 = Item.new(title: "Private Ford Theatre Balcony Suite",
                  description: "Privacy guarenteed, or your money back",
                  price: 14000,
                  image: open(path + "ex_washington_dc2.jpg"))

item18.categories << categories[4]
item18.save

item19 = Item.new(title: "House of Cards",
                  description: "Power is a lot like real estate. It’s all about location, location, location. The closer you are to the source, the higher your property value.",
                  price: 11000,
                  image: open(path + "ex_washington_dc.jpg"))

item19.categories << categories[4]
item19.save

item20 = Item.new(title: "The West Wing",
                  description: "Join the Bartlet's, Leo (deceased), C. J., Josh, Toby, Donna, Charlie and Sam in this White house replica",
                  price: 16000,
                  image: open(path + "ex_washington_dc2.jpg"))

item20.categories << categories[4]
item20.save
