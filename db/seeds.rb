# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all
Category.delete_all
Company.delete_all

Category.create(name: 'Pizza', icon_type: 'pizza', description: "God's meal")
Category.create(name: 'Burger', icon_type: 'pburger', description: 'American pie')
Category.create(name: 'Pasta', icon_type: 'pasta', description: 'Italiano food')

Company.create(name: 'Pied Piper',
               categories: Category.pluck(:id),
               contact_info: { phone: '01234567890', email: 'a@b.com' })


Product.create(
  category_id: Category.second.id,
  company_id: Company.first.id,
  title: 'Chikenburger',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
  main_options: [{ main: 150 }],
  additional_info: { 'salad' => 40, 'sour-cream' => 30, 'bacon' => 50 },
)
Product.create(
  category_id: Category.second.id,
  company_id: Company.first.id,
  title: 'Cheeseburger',
  description: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
  main_options: [{ chiken: 200 }, { beef: 300 }, { pork: 300 }],
  additional_info: { 'salad' => 40, 'bacon' => 50 },
)
Product.create(
  category_id: Category.second.id,
  company_id: Company.first.id,
  title: 'Peperoni',
  description: 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
  main_options: [{ '30 cm' => 500 }, { '45 cm' => 750 }],
  additional_info: { 'tomato' => 70 },
)
Product.create(
  category_id: Category.second.id,
  company_id: Company.first.id,
  title: 'Quadro formajo',
  description: 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  main_options: [{ '30 cm' => 450 }, { '45 cm' => 700 }],
  additional_info: { 'tomato' => 40 },
)
