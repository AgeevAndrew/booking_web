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


Product.create(category_id: Category.second.id, company_id: Company.first.id, title: 'Chikenburger', main_options: [{ cost: 150 }])
Product.create(category_id: Category.second.id, company_id: Company.first.id, title: 'Cheeseburger', main_options: [{ cost: 200 }])
