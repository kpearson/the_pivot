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
listing1 = Listing.new(title: "Denver B&B",
                 description: "Denver Omeletes and Canibus for everyone!",
                 category_id: 2,
                 max_guests: 2,
                 nightly_rate: 11000,
                 address1: "110 Elm St",
                 address2: nil,
                 city: "Denver",
                 state: "CO",
                 zip: 80022,
                 shared_bathroom: true,
                 user_id: 1
                 image: open(path + "ex_denver.jpg"))

listing1.categories << categories[0]
listing1.save

listing2 = Listing.new(title: "Denver Love Shack",
                 description: "Mile High Escape",
                 category_id: 2,
                 max_guests: 2,
                 nightly_rate: 7500,
                 address1: "111 Elm St",
                 address2: nil,
                 city: "Denver",
                 state: "CO",
                 zip: 80022,
                 shared_bathroom: true,
                 user_id: 1
                 image: open(path + "ex_denver.jpg"))

listing2.categories << categories[0]
listing2.save

listing3 = Listing.new(title: "Denver Mountain Retreat",
                 description: "The Air is thin up there, boil your eggs a couple minutes longer than normal.",
                 category_id: 2,
                 max_guests: 8,
                 nightly_rate: 15000,
                 address1: "112 Elm St",
                 address2: nil,
                 city: "Denver",
                 state: "CO",
                 zip: 80022,
                 shared_bathroom: true,
                 user_id: 1
                 image: open(path + "ex_denver.jpg"))

listing3.categories << categories[0]
listing3.save

#New York --------------------------------------------------------------------
listing4 = Listing.new(title: "Big lights will inspire you",
                 description: "City so nice they named it twice",
                 category_id: 2,
                 max_guests: 4,
                 nightly_rate: 12000,
                 address1: "113 Elm St",
                 address2: nil,
                 city: "New York",
                 state: "NY",
                 zip: 10001,
                 shared_bathroom: true,
                 user_id: 1
                 image: open(path + "ex_new_york.jpg"))

listing4.categories << categories[1]
listing4.save

listing5 = Listing.new(title: "Empire State of Mind",
                 description: "City so nice they named it thrice",
                 category_id: 2,
                 max_guests: 6,
                 nightly_rate: 11000,
                 address1: "114 Elm St",
                 address2: nil,
                 city: "New York",
                 state: "NY",
                 zip: 10001,
                 shared_bathroom: true,
                 user_id: 1
                 image: open(path + "ex_new_york2.jpg"))

listing5.categories << categories[1]
listing5.save

listing6 = Listing.new(title: "These streets will make you feel brand new",
                 description: "City so nice they named it one-time",
                 category_id: 2,
                 max_guests: 5,
                 nightly_rate: 15000,
                 address1: "115 Elm St",
                 address2: nil,
                 city: "Denver",
                 state: "CO",
                 zip: 10001,
                 shared_bathroom: true,
                 user_id: 1
                 image: open(path + "ex_new_york.jpg"))

listing6.categories << categories[1]
listing6.save

#Seattles ----------------------------------------------------------------

listing7 = Listing.new(title: "Rain City, USA Condo",
                 description: "Cold, wet and smells like fish",
                 category_id: 2,
                 max_guests: 4,
                 nightly_rate: 10000,
                 address1: "116 Elm St",
                 address2: nil,
                 city: "Seattle",
                 state: "WA",
                 zip: 98106,
                 shared_bathroom: true,
                 user_id: 1
                 image: open(path + "ex_seattle.jpg"))

listing7.categories << categories[2]
listing7.save

listing8 = Listing.new(title: "Pike Place Market Bungalo",
                 description: "Copper River Salmon!",
                 category_id: 2,
                 max_guests: 4,
                 nightly_rate: 15000,
                 address1: "117 Elm St",
                 address2: nil,
                 city: "Seattle",
                 state: "WA",
                 zip: 98106,
                 shared_bathroom: true,
                 user_id: 1
                 image: open(path + "ex_seattle.jpg"))

listing8.categories << categories[2]
listing8.save

listing9 = Listing.new(title: "Mt Rainier Cabin",
                description: "If you like camping on a volcano, we have the place for you!",
                category_id: 2,
                max_guests: 8,
                nightly_rate: 8000,
                address1: "118 Elm St",
                address2: nil,
                city: "Seattle",
                state: "WA",
                zip: 98106,
                shared_bathroom: true,
                user_id: 1
                image: open(path + "ex_seattle.jpg"))

listing9.categories << categories[2]
listing9.save

# San Francisco-------------------------------------------------------------
listing10 = Listing.new(title: "Haight-Ashbury Hostel",
                  description: "Smells like teen hippies.",
                  category_id: 2,
                  max_guests: 25,
                  nightly_rate: 26000,
                  address1: "119 Elm St",
                  address2: nil,
                  city: "San Francisco",
                  state: "CA",
                  zip: 80022,
                  shared_bathroom: true,
                  user_id: 1
                  image: open(path + "ex_san_francisco.jpg"))

listing10.categories << categories[3]
listing10.save

listing11 = Listing.new(title: "Golden Gate Escape",
                  description: "aka Alcatraz",
                  category_id: 2,
                  max_guests: 120,
                  nightly_rate: 11000,
                  address1: "120 Elm St",
                  address2: nil,
                  city: "San Francisco",
                  state: "CA",
                  zip: 80022,
                  shared_bathroom: true,
                  user_id: 1
                  image: open(path + "ex_san_francisco.jpg"))

listing11.categories << categories[3]
listing11.save

listing12 = Listing.new(title: "Planet of the Apes Treehouse",
                  description: "We've got Funky Monkeys!",
                  category_id: 2,
                  max_guests: 8,
                  nightly_rate: 14000,
                  address1: "121 Elm St",
                  address2: nil,
                  city: "San Francisco",
                  state: "CA",
                  zip: 80022,
                  shared_bathroom: true,
                  user_id: 1
                  image: open(path + "ex_san_francisco.jpg"))

listing12.categories << categories[3]
listing12.save


# Washington-----------------------------------------------------------
listing13 = Listing.new(title: "Condo on the Mall",
                  description: "Not that kind of mall, dummy",
                  category_id: 2,
                  max_guests: 4,
                  nightly_rate: 16000,
                  address1: "122 Elm St",
                  address2: nil,
                  city: "Washington",
                  state: "DC",
                  zip: 22314,
                  shared_bathroom: true,
                  user_id: 1
                  image: open(path + "ex_washington_dc.jpg"))

listing13.categories << categories[4]
listing13.save

listing14 = Listing.new(title: "Capital Hill House",
                  description: "We like our house guests like we like our politicians, clean and self-serving.",
                  category_id: 2,
                  max_guests: 6,
                  nightly_rate: 11000,
                  address1: "123 Elm St",
                  address2: nil,
                  city: "Washington",
                  state: "DC",
                  zip: 22314,
                  shared_bathroom: true,
                  user_id: 1
                  image: open(path + "ex_washington_dc2.jpg"))

listing14.categories << categories[4]
listing14.save

listing15 = Listing.new(title: "Filibuster Flat",
                  description: "Perfet for those who never shut up.",
                  category_id: 2,
                  max_guests: 2,
                  nightly_rate: 14000,
                  address1: "124 Elm St",
                  address2: nil,
                  city: "Washington",
                  state: "DC",
                  zip: 22314,
                  shared_bathroom: true,
                  user_id: 1
                  image: open(path + "ex_washington_dc.jpg"))

listing15.categories << categories[4]
listing15.save

listing16 = Listing.new(title: "Lincoln Bedroom",
                  description: "In the White Horse!",
                  category_id: 2,
                  max_guests: 2,
                  nightly_rate: 9000,
                  address1: "125 Elm St",
                  address2: nil,
                  city: "Washington",
                  state: "DC",
                  zip: 22314,
                  shared_bathroom: true,
                  user_id: 1
                  image: open(path + "ex_washington_dc.jpg"))

listing16.categories << categories[4]
listing16.save

listing17 = Listing.new(title: "Cherry Blossom B&B",
                  description: "Stay in on our luxurious paddlewheel river boats on Tidal Basin",
                  category_id: 2,
                  max_guests: 2,
                  nightly_rate: 10000,
                  address1: "126 Elm St",
                  address2: nil,
                  city: "Washington",
                  state: "DC",
                  zip: 22314,
                  shared_bathroom: true,
                  user_id: 1
                  image: open(path + "ex_washington_dc.jpg"))

listing17.categories << categories[4]
listing17.save

listing18 = Listing.new(title: "Private Ford Theatre Balcony Suite",
                  description: "Privacy guarenteed, or your money back",
                  category_id: 2,
                  max_guests: 4,
                  nightly_rate: 14000,
                  address1: "127 Elm St",
                  address2: nil,
                  city: "Washington",
                  state: "DC",
                  zip: 22314,
                  shared_bathroom: true,
                  user_id: 1
                  image: open(path + "ex_washington_dc2.jpg"))

listing18.categories << categories[4]
listing18.save

listing19 = Listing.new(title: "House of Cards",
                  description: "I’ve always loathed the necessity of sleep. Like death, it puts even the most powerful men on their backs.",
                  category_id: 2,
                  max_guests: 10,
                  nightly_rate: 11000,
                  address1: "128 Elm St",
                  address2: nil,
                  city: "Washington",
                  state: "DC",
                  zip: 22314,
                  shared_bathroom: true,
                  user_id: 1
                  image: open(path + "ex_washington_dc.jpg"))

listing19.categories << categories[4]
listing19.save

listing20 = Listing.new(title: "The West Wing",
                  description: "Join the Bartlet's, Leo (deceased), C. J., Josh, Toby, Donna, Charlie and Sam in this White house replica",
                  category_id: 2,
                  max_guests: 12,
                  nightly_rate: 16000,
                  address1: "129 Elm St",
                  address2: nil,
                  city: "Washington",
                  state: "DC",
                  zip: 22314,
                  shared_bathroom: true,
                  user_id: 1
                  image: open(path + "ex_washington_dc2.jpg"))

listing20.categories << categories[4]
listing20.save
