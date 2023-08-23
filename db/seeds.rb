
appetizers = Category.create(name: "Appetizers")
main_courses = Category.create(name: "Main Courses")
desserts = Category.create(name: "Desserts")
beverages = Category.create(name: "Beverages")
specials = Category.create(name: "Specials")
appetizers.save
main_courses.save
desserts.save
beverages.save
specials.save
appetizers = Category.find_by(name: "Appetizers")
main_courses = Category.find_by(name: "Main Courses")
desserts = Category.find_by(name: "Desserts")
beverages = Category.find_by(name: "Beverages")
specials = Category.find_by(name: "Specials")



# Create items for multiple categories
appetizers.items.create(title: "Chicken Wings", description: "Crispy chicken wings seasoned to perfection.", price: 350)
appetizers.items.create(title: "Cheese Stuffed Mushrooms", description: "Mushroom caps filled with creamy cheese.", price: 300)

main_courses.items.create(title: "Grilled Steak", description: "Tender and juicy grilled steak with your choice of sauce.", price: 800)
main_courses.items.create(title: "Roast Chicken", description: "Roasted chicken served with flavorful herbs.", price: 650)

desserts.items.create(title: "Chocolate Fondue", description: "Assorted fruits dipped in rich chocolate fondue.", price: 400)
desserts.items.create(title: "Creme Brulee", description: "Classic custard dessert with a caramelized sugar topping.", price: 350)

beverages.items.create(title: "Iced Coffee", description: "Chilled coffee with a splash of milk and sweetener.", price: 250)
beverages.items.create(title: "Mint Lemonade", description: "Refreshing mint-flavored lemonade.", price: 180)

specials.items.create(title: "Seafood Paella", description: "Traditional Spanish rice dish with seafood and saffron.", price: 900)
specials.items.create(title: "Eggplant Parmesan", description: "Breaded and fried eggplant layered with tomato sauce and cheese.", price: 550)

# Appetizers
appetizers.items.create(title: "Spinach Artichoke Dip", description: "Creamy dip with spinach, artichokes, and melted cheese.", price: 320)
appetizers.items.create(title: "Stuffed Jalapenos", description: "Jalapeno peppers stuffed with cream cheese and bacon.", price: 280)

# Main Courses
main_courses.items.create(title: "Chicken Alfredo", description: "Grilled chicken served with creamy Alfredo sauce.", price: 720)
main_courses.items.create(title: "Beef Lasagna", description: "Layers of beef, pasta, and cheese baked to perfection.", price: 550)

# Desserts
desserts.items.create(title: "Tiramisu", description: "Classic Italian dessert with layers of coffee-soaked ladyfingers.", price: 380)
desserts.items.create(title: "Apple Crumble", description: "Baked apple dessert topped with a crispy crumb topping.", price: 300)

# Beverages
beverages.items.create(title: "Classic Mojito", description: "Refreshing cocktail with mint, lime, and rum.", price: 320)
beverages.items.create(title: "Orange Juice", description: "Freshly squeezed orange juice.", price: 150)

# Specials
specials.items.create(title: "Grilled Sea Bass", description: "Grilled sea bass fillet seasoned with herbs.", price: 850)
specials.items.create(title: "Mushroom Risotto", description: "Creamy risotto with sautéed mushrooms and parmesan.", price: 480)

# Create items attached to multiple categories
item = Item.create(title: "Fruit Salad", description: "Fresh fruit salad with a variety of seasonal fruits.", price: 200)
item.categories << [appetizers, desserts]

item = Item.create(title: "Pasta Alfredo", description: "Creamy Alfredo sauce with pasta and parmesan cheese.", price: 450)
item.categories << [main_courses, specials]
item = Item.create(title: "Chicken Caesar Salad", description: "Crisp romaine lettuce with grilled chicken, croutons, and Caesar dressing.", price: 320)
item.categories << [appetizers, main_courses]

item = Item.create(title: "Margherita Pizza", description: "Classic pizza topped with fresh tomatoes, mozzarella, and basil.", price: 400)
item.categories << [appetizers, main_courses]

item = Item.create(title: "Chocolate Chip Pancakes", description: "Fluffy pancakes with chocolate chips, served with maple syrup.", price: 280)
item.categories << [appetizers, main_courses]


item = Item.create(title: "Mango Lassi", description: "Creamy yogurt-based drink with sweet mango flavor.", price: 200)
item.categories << [beverages, desserts]
# Create normal users
User.create(
  full_name: "Rachel Warbelow",
  email: "demo+rachel@jumpstartlab.com",
  password: "password"
)

User.create(
  full_name: "Jeff Casimir",
  email: "demo+jeff@jumpstartlab.com",
  password: "password",
  display_name: "j3"
)

User.create(
  full_name: "Jorge Tellez",
  email: "demo+jorge@jumpstartlab.com",
  password: "password",
  display_name: "novohispano"
)

# Create admin user
User.create(
  full_name: "Josh Cheek",
  email: "demo+josh@jumpstartlab.com",
  password: "password",
  display_name: "josh",
  admin: true
)
# Create orders with items and quantities
# User: Rachel Warbelow
user_rachel = User.find_by(email: "demo+rachel@jumpstartlab.com")

# Order 1 (Ordered)
order1 = user_rachel.orders.create(status: "ordered")
order1.order_items.create(item: Item.find_by(title: "Chicken Wings"), quantity: 2)
order1.order_items.create(item: Item.find_by(title: "Grilled Steak"), quantity: 1)

# Order 2 (Completed)
order2 = user_rachel.orders.create(status: "completed")
order2.order_items.create(item: Item.find_by(title: "Chocolate Fondue"), quantity: 3)
order2.order_items.create(item: Item.find_by(title: "Iced Coffee"), quantity: 2)

# User: Jeff Casimir
user_jeff = User.find_by(email: "demo+jeff@jumpstartlab.com")

# Order 3 (Ordered)
order3 = user_jeff.orders.create(status: "ordered")
order3.order_items.create(item: Item.find_by(title: "Beef Lasagna"), quantity: 1)
order3.order_items.create(item: Item.find_by(title: "Eggplant Parmesan"), quantity: 1)

# Order 4 (Cancelled)
order4 = user_jeff.orders.create(status: "cancelled")
order4.order_items.create(item: Item.find_by(title: "Stuffed Jalapenos"), quantity: 2)
order4.order_items.create(item: Item.find_by(title: "Mint Lemonade"), quantity: 2)

# User: Jorge Tellez
user_jorge = User.find_by(email: "demo+jorge@jumpstartlab.com")

# Order 5 (Completed)
order5 = user_jorge.orders.create(status: "completed")
order5.order_items.create(item: Item.find_by(title: "Tiramisu"), quantity: 1)
order5.order_items.create(item: Item.find_by(title: "Seafood Paella"), quantity: 3)

# Order 6 (Ordered)
order6 = user_jorge.orders.create(status: "ordered")
order6.order_items.create(item: Item.find_by(title: "Beef Lasagna"), quantity: 2)
order6.order_items.create(item: Item.find_by(title: "Mint Lemonade"), quantity: 1)

