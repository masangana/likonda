require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p "Seeding database..."

# Create 2 users
2.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 123456, password_confirmation: 123456)
end

# Create 11 groups
Group.create(name: "Housing", icon: "house")
Group.create(name: "Transportation", icon: "directions_car")
Group.create(name: "Food", icon: "restaurant")
Group.create(name: "Utilities", icon: "lightbulb")
Group.create(name: "Insurance", icon: "emergency")
Group.create(name: "Medical & Healthcare", icon: "local_hospital")
Group.create(name: "Saving, Investing, & Debt Payments", icon: "attach_money")
Group.create(name: "Personal Spending", icon: "shopping_cart")
Group.create(name: "Recreation & Entertainment", icon: "sports_esports")
Group.create(name: "Education", icon: "school")
Group.create(name: "Miscellaneous", icon: "more_horiz")

# Create 200 budgets
User.all.each do |user|
  100.times do
    user.budgets.create(user_id: user.id, name: Faker::Commerce.unique.department, amount: Faker::Commerce.price)
  end
end

# Create 200 group_budgets
200.times.each do
  GroupBudget.create(group_id: Group.all.sample.id, budget_id: Budget.all.sample.id)
end


p "Seeding complete!"

p "Created #{User.count} users"
p "Created #{Group.count} groups"
p "Created #{Budget.count} budgets"
p "Created #{GroupBudget.count} group_budgets"