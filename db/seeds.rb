Admin.create([{ first_name: "Admin_first",
                last_name: "Admin_last",
                email: "admin@email.com",
                password: "password"
                }])

User.create([{ first_name: "Alice",
               last_name: "alast_name",
               email: "alice@email.com",
               about_me: "valid",
               display_name: "Alice",
               password: "password",
               slug: "Alice"},
             { first_name: "Bob",
               last_name: "blast_name",
               email: "bob@email.com",
               about_me: "valid",
               display_name: "Robert",
               password: "password",
               slug: "Robert"},
             { first_name: "Carol",
               last_name: "clast_name",
               email: "carlo@email.com",
               about_me: "valid",
               display_name: "Cali",
               password: "password",
               slug: "Cali"},
             { first_name: "Dave",
               last_name: "dlast_name",
               email: "dave@email.com",
               about_me: "valid",
               display_name: "Dave",
               password: "password",
               slug: "Dave"},
             { first_name: "eve",
               last_name: "elast_name",
               email: "eve@email.com",
               about_me: "valid",
               display_name: "Eve",
               password: "password",
               slug: "Eve",
               }])

categories = Category.create([{ name: "House" },
                              { name: "Apartment" },
                              { name: "Condo" },
                              { name: "Cabin" },
                              { name: "Room"
                                }])

#Denver -----------------------------------------------------------------
listing1 = Listing.create(title: "Denver B&B",
                          description: "Denver Omeletes and Canibus for everyone!",
                          category_id: 5,
                          max_guests: 2,
                          nightly_rate: 11000,
                          address1: "110 Elm St",
                          address2: nil,
                          city: "Denver",
                          state: "CO",
                          zip: 80022,
                          shared_bathroom: true,
                          user_id: 1
                          )
li = ListingImage.create(image: File.open(File.join(Rails.root, 'app/assets/images/denver.jpg')))
listing1.listing_images << li
listing1.save

listing2 = Listing.create(title: "Denver Love Shack",
                          description: "Mile High Escape",
                          category_id: 4,
                          max_guests: 2,
                          nightly_rate: 7000,
                          address1: "111 Elm St",
                          address2: nil,
                          city: "Denver",
                          state: "CO",
                          zip: 80022,
                          shared_bathroom: true,
                          user_id: 1
                          )
li = ListingImage.create(image: File.open(File.join(Rails.root, 'app/assets/images/denver.jpg')))
listing2.listing_images << li
listing2.save

listing3 = Listing.create(title: "Denver Mountain Retreat",
                          description: "The Air is thin up there, boil your eggs a couple minutes longer than normal.",
                          category_id: 4,
                          max_guests: 8,
                          nightly_rate: 15000,
                          address1: "112 Elm St",
                          address2: nil,
                          city: "Denver",
                          state: "CO",
                          zip: 80022,
                          shared_bathroom: true,
                          user_id: 2
                          )
li = ListingImage.create(image: File.open(File.join(Rails.root, 'app/assets/images/denver.jpg')))
listing3.listing_images << li
listing3.save

#New York --------------------------------------------------------------------
listing4 = Listing.create(title: "Big lights will inspire you",
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
                          user_id: 4
                          )
li = ListingImage.create(image: File.open(File.join(Rails.root, 'app/assets/images/new_york.jpg')))
listing4.listing_images << li
listing4.save

listing5 = Listing.create(title: "Empire State of Mind",
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
                          user_id: 4
                          )
li = ListingImage.create(image: File.open(File.join(Rails.root, 'app/assets/images/new_york.jpg')))
listing5.listing_images << li
listing5.save

listing6 = Listing.create(title: "These streets will make you feel brand new",
                          description: "City so nice they named it one-time",
                          category_id: 2,
                          max_guests: 5,
                          nightly_rate: 15000,
                          address1: "115 Elm St",
                          address2: nil,
                          city: "New York",
                          state: "NY",
                          zip: 10001,
                          shared_bathroom: true,
                          user_id: 1
                          )

li = ListingImage.create(image: File.open(File.join(Rails.root, 'app/assets/images/new_york2.jpg')))
listing6.listing_images << li
listing6.save

#Seattles ----------------------------------------------------------------

listing7 = Listing.create(title: "Rain City, USA Condo",
                          description: "Cold, wet and smells like fish",
                          category_id: 3,
                          max_guests: 4,
                          nightly_rate: 10000,
                          address1: "116 Elm St",
                          address2: nil,
                          city: "Seattle",
                          state: "WA",
                          zip: 98106,
                          shared_bathroom: true,
                          user_id: 1
                          )
li = ListingImage.create(image: File.open(File.join(Rails.root, 'app/assets/images/seattle.jpg')))
listing7.listing_images << li
listing7.save

listing8 = Listing.create(title: "Pike Place Market Bungalo",
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
                          user_id: 2
                          )
li = ListingImage.create(image: File.open(File.join(Rails.root, 'app/assets/images/seattle.jpg')))
listing8.listing_images << li
listing8.save

listing9 = Listing.create(title: "Mt Rainier Cabin",
                          description: "If you like camping on a volcano, we have the place for you!",
                          category_id: 4,
                          max_guests: 8,
                          nightly_rate: 8000,
                          address1: "118 Elm St",
                          address2: nil,
                          city: "Seattle",
                          state: "WA",
                          zip: 98106,
                          shared_bathroom: true,
                          user_id: 3
                          )
li = ListingImage.create(image: File.open(File.join(Rails.root, 'app/assets/images/seattle.jpg')))
listing9.listing_images << li
listing9.save

# San Francisco-------------------------------------------------------------
listing10 = Listing.create(title: "Haight-Ashbury Hostel",
                           description: "Smells like teen hippies.",
                           category_id: 5,
                           max_guests: 25,
                           nightly_rate: 26000,
                           address1: "119 Elm St",
                           address2: nil,
                           city: "San Francisco",
                           state: "CA",
                           zip: 80022,
                           shared_bathroom: true,
                           user_id: 4
                           )
li = ListingImage.create(image: File.open(File.join(Rails.root, 'app/assets/images/san_francisco.jpg')))
listing10.listing_images << li
listing10.save

listing11 = Listing.create(title: "Golden Gate Escape",
                           description: "aka Alcatraz",
                           category_id: 5,
                           max_guests: 120,
                           nightly_rate: 11000,
                           address1: "120 Elm St",
                           address2: nil,
                           city: "San Francisco",
                           state: "CA",
                           zip: 80022,
                           shared_bathroom: true,
                           user_id: 2
                           )
li = ListingImage.create(image: File.open(File.join(Rails.root, 'app/assets/images/san_francisco.jpg')))
listing11.listing_images << li
listing11.save

listing12 = Listing.create(title: "Planet of the Apes Treehouse",
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
                           )
li = ListingImage.create(image: File.open(File.join(Rails.root, 'app/assets/images/san_francisco.jpg')))
listing12.listing_images << li
listing12.save


# Washington-----------------------------------------------------------
listing13 = Listing.create(title: "Condo on the Mall",
                           description: "Not that kind of mall, dummy",
                           category_id: 3,
                           max_guests: 4,
                           nightly_rate: 16000,
                           address1: "122 Elm St",
                           address2: nil,
                           city: "Washington",
                           state: "DC",
                           zip: 22314,
                           shared_bathroom: true,
                           user_id: 2
                           )
li = ListingImage.create(image: File.open(File.join(Rails.root, 'app/assets/images/washington_dc.jpg')))
listing13.listing_images << li
listing13.save

listing14 = Listing.create(title: "Capital Hill House",
                           description: "We like our house guests like we like our politicians, clean and self-serving.",
                           category_id: 1,
                           max_guests: 6,
                           nightly_rate: 11000,
                           address1: "123 Elm St",
                           address2: nil,
                           city: "Washington",
                           state: "DC",
                           zip: 22314,
                           shared_bathroom: true,
                           user_id: 3
                           )
li = ListingImage.create(image: File.open(File.join(Rails.root, 'app/assets/images/washington_dc.jpg')))
listing14.listing_images << li
listing14.save

listing15 = Listing.create(title: "Gateway to the West",
                           description: "Perfet Apt for those who don't know their cardinal directions.",
                           category_id: 2,
                           max_guests: 2,
                           nightly_rate: 14000,
                           address1: "124 Elm St",
                           address2: nil,
                           city: "St Louis",
                           state: "MO",
                           zip: 63114,
                           shared_bathroom: true,
                           user_id: 4
                           )
li = ListingImage.create(image: File.open(File.join(Rails.root, 'app/assets/images/washington_dc.jpg')))
listing15.listing_images << li
listing15.save

listing16 = Listing.create(title: "Lincoln Bedroom",
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
                           user_id: 3
                           )
li = ListingImage.create(image: File.open(File.join(Rails.root, 'app/assets/images/washington_dc.jpg')))
listing16.listing_images << li
listing16.save

listing17 = Listing.create(title: "Cherry Blossom B&B",
                           description: "Stay in on our luxurious paddlewheel river boat and cruise in style up the Tidal Basin",
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
                           )
li = ListingImage.create(image: File.open(File.join(Rails.root, 'app/assets/images/washington_dc.jpg')))
listing17.listing_images << li
listing17.save

listing18 = Listing.create(title: "Private Ford Theatre Balcony Suite",
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
                           user_id: 2
                           )
li = ListingImage.create(image: File.open(File.join(Rails.root, 'app/assets/images/washington_dc2.jpg')))
listing18.listing_images << li
listing18.save

listing19 = Listing.create(title: "House of Cards",
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
                           user_id: 3
                           )
li = ListingImage.create(image: File.open(File.join(Rails.root, 'app/assets/images/washington_dc2.jpg')))
listing19.listing_images << li
listing19.save

listing20 = Listing.create(title: "The West Wing",
                           description: "Join the Bartlet's, Leo (now deceased), C. J., Josh, Toby, Donna, Charlie and Sam in this White house replica",
                           category_id: 2,
                           max_guests: 12,
                           nightly_rate: 16000,
                           address1: "129 Elm St",
                           address2: nil,
                           city: "Washington",
                           state: "DC",
                           zip: 22314,
                           shared_bathroom: true,
                           user_id: 4
                           )
li = ListingImage.create(image: File.open(File.join(Rails.root, 'app/assets/images/washington_dc.jpg')))
listing20.listing_images << li
listing20.save
