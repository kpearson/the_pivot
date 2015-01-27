# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = Category.create([{ name: "Breakfast" },
                              { name: "Brunch" },
                              { name: "Lunch" },
                              { name: "Dinner" },
                              { name: "Dessert"}])

#breakfast items
Item.create(title: "Bagel Sandwich",
            description: "Toasted bagel, fried egg, and bacon",
            price: 750,
            image: "bagel_sandwich.jpg")

CategoryItem.create(item_id: 1, category_id: 1)

Item.create(title: "Bacon and Egg Cups",
            description: "Bacon cups filled with egg",
            price: 1100,
            image: "bacon_and_egg_cups.jpg")

CategoryItem.create(item_id: 2, category_id: 1)

Item.create(title: "Bacon, Egg, and Cheddar Scones",
            description: "Fresh cheddar cheese mixed with bacon and egg",
            price: 1500,
            image: "scones.jpg")

CategoryItem.create(item_id: 3, category_id: 1)

#brunch items --------------------------------------------------------------
Item.create(title: "Casserole",
            description: "Delicious casserole filled with bacon",
            price: 1200,
            image: "casserole.jpg")

CategoryItem.create(item_id: 4, category_id: 2)

Item.create(title: "Asparagus Mushroom Bacon Quiche",
            description: "Nothing better than a quiche with bacon",
            price: 1100,
            image: "quiche.jpg")

CategoryItem.create(item_id: 5, category_id: 2)

Item.create(title: "Grilled Cheese French Toast With Bacon",
            description: "Grilled cheese.  French toast.  Bacon.  Nuff said",
            price: 1500,
            image: "grilled_cheese.jpg")

CategoryItem.create(item_id: 6, category_id: 2)

#Lunch ----------------------------------------------------------------

Item.create(title: "Bacon-Wrapped Jalapeno Poppers",
            description: "Super spicy!",
            price: 1000,
            image: "pepper.jpg")

CategoryItem.create(item_id: 7, category_id: 3)

Item.create(title: "Bacon Wrapped Chicken",
            description: "Farm raised chicken wrapped in bacon, and grilled to perfection",
            price: 1500,
            image: "bacon_wrapped_chicken.jpg")

CategoryItem.create(item_id: 8, category_id: 3)

Item.create(title: "Bacon Potato Soup",
            description: "Hot soup with a touch of bacon",
            price: 800,
            image: "soup.jpg")

CategoryItem.create(item_id: 9, category_id: 3)

# Dinner -------------------------------------------------------------
Item.create(title: "Sweet Bacon-Wrapped Venison Tenderloin",
            description: "Freshly hunted venison wrapped in crispy bacon.  It's a meal that is deer to me.",
            price: 2600,
            image: "venison.jpg")

CategoryItem.create(item_id: 10, category_id: 4)

Item.create(title: "Spinach Salad with Honey Bacon Dressing",
            description: "Have some healthy salad... smotherer in honey bacon dressing",
            price: 1100,
            image: "salad.jpg")

CategoryItem.create(item_id: 11, category_id: 4)

Item.create(title: "Bacon Cheeseburger Pasta",
            description: "Perfect combination of bacon, burger, cheese, and pasta",
            price: 1400,
            image: "pasta.jpg")

CategoryItem.create(item_id: 12, category_id: 4)


# dessert -----------------------------------------------------------
Item.create(title: "Pecan-Bacon Squares a la Mode",
            description: "A warm treat topped with delicous vanilla ice cream",
            price: 1600,
            image: "venison.jpg")

CategoryItem.create(item_id: 13, category_id: 5)

Item.create(title: "Cupcakes",
            description: "Chocolate-Bacon Cupcakes with Dulce De Lech Frosting",
            price: 1100,
            image: "cupcakes.jpg")

CategoryItem.create(item_id: 14, category_id: 5)

Item.create(title: "Apple Bacon Galette",
            description: "Perfet end to a perfect meal",
            price: 1400,
            image: "galette.jpg")

CategoryItem.create(item_id: 15, category_id: 5)

Item.create(title: "Bacon Skewers",
            description: "Maple Chocolate Bacon Skewers",
            price: 900,
            image: "skewers.jpg")

CategoryItem.create(item_id: 16, category_id: 5)

Item.create(title: "Chocolate Brownies",
            description: "Smothered in vanilla icing and bacon!",
            price: 1000,
            image: "brownies.jpg")

CategoryItem.create(item_id: 17, category_id: 5)

Item.create(title: "Ice Cream",
            description: "Bacon infused ice cream",
            price: 1400,
            image: "ice_cream2.jpg")

CategoryItem.create(item_id: 18, category_id: 5)

Item.create(title: "Chipotle Bacon Spicy Pecan Caramel Apples",
            description: "Spicy sweet savory crunchy tart crisp",
            price: 1100,
            image: "apples.jpg")

CategoryItem.create(item_id: 19, category_id: 5)

Item.create(title: "Bacon Treats",
            description: "Chocolate covered bacon strips with sprinkles",
            price: 1600,
            image: "choc_covered.jpg")

CategoryItem.create(item_id: 20, category_id: 5)
