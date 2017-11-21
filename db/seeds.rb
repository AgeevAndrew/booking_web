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
Account.delete_all
Address.delete_all
Status.delete_all

Status.create(id: 10_010, name: 'Новый', position: 1)
Status.create(id: 10_020, name: 'Подтвержден', position: 2)
Status.create(id: 10_030, name: 'Отменен', position: 3)

Category.create(name: 'Бургеры', icon_type: 'icon_burger', description: '')
Category.create(name: 'Пицца', icon_type: 'icon_pizza', description: '')
Category.create(name: 'Крылышки', icon_type: 'icon_wing', description: '')
Category.create(name: 'Ножки', icon_type: 'icon_leg', description: '')
Category.create(name: 'Картофель фри и чипсы', icon_type: 'icon_chips', description: '')
Category.create(name: 'Салаты', icon_type: 'icon_salat', description: '')
Category.create(name: 'Соусы', icon_type: 'icon_sauce', description: '')
Category.create(name: 'Супы', icon_type: 'icon_soup', description: '')
Category.create(name: 'Напитки', icon_type: 'icon_drinks', description: '')
Category.create(name: 'Наборы', icon_type: 'icon_set', description: '')

Company.create(name: 'Pied Piper',
               categories: Category.pluck(:id),
               delivery: { cost: 300, free_shipping: 1_500, pickup_discount: 10, period: { start: '09:00 Vladivostok', end: '18:00 Vladivostok' } },
               contact_info: { phone: '01234567890', email: 'a@b.com' })

Product.create(
  category_id: Category.first.id,
  company_id: Company.first.id,
  title: 'Chickenburger',
  brief: 'Chicken for slim ckiks',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
  photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/burger1.png',
  main_options: [{ name: 'beef', cost: 150 }],
  additional_info: [{ name: '🥗 salad', cost: 40 }, { name: '😋 sour-cream', cost: 30 }, { name: '🥓 bacon', cost: 50 }],
)
Product.create(
  category_id: Category.first.id,
  company_id: Company.first.id,
  title: 'Cheeseburger',
  brief: 'Cheese cheese cheese',
  description: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
  photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/burger2.png',
  main_options: [{ name: 'chiken', cost: 200 }, { name: 'beef', cost: 300 }, { name: 'pork', cost: 300 }],
  additional_info: [{ name: '🥗 salad', cost: 40 }, { name: '🥓 bacon', cost: 50 }],
)
Product.create(
  category_id: Category.first.id,
  company_id: Company.first.id,
  title: 'Chiliburger',
  brief: 'Very very spicy and hot',
  description: 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
  photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/burger3.png',
  main_options: [{ name: 'chiken', cost: 200 }, { name: 'beef', cost: 300 }, { name: 'pork', cost: 300 }],
  additional_info: [{ name: '🥗 salad', cost: 40 }, { name: '🥓 bacon', cost: 50 }],
)
Product.create(
  category_id: Category.first.id,
  company_id: Company.first.id,
  title: 'Big Mac',
  brief: 'The big bang burger',
  description: 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
  photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/burger4.png',
  main_options: [{ name: 'chiken', cost: 200 }, { name: 'beef', cost: 300 }, { name: 'pork', cost: 300 }],
  additional_info: [{ name: '🥗 salad', cost: 40 }, { name: '🥓 bacon', cost: 50 }],
)
Product.create(
  category_id: Category.second.id,
  company_id: Company.first.id,
  title: 'Peperoni',
  brief: "It's delisious",
  description: 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
  photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/burger5.png',
  main_options: [{ name: '30 cm', cost: 500 }, { name: '45 cm', cost: 750 }],
  additional_info: [{ name: '🍅 tomato', cost: 70 }],
)
Product.create(
  category_id: Category.second.id,
  company_id: Company.first.id,
  title: 'Quadro formajo',
  brief: 'It is the best cheese pizza',
  description: 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/burger6.png',
  main_options: [{ name: '30 cm', cost: 450 }, { name: '45 cm', cost: 700 }],
  additional_info: [{ name: '🍅 tomato', cost: 40 }],
)

Address.create(
  city: 'Астрахань',
  code: '71',
  floor: '4',
  house: '144',
  title: 'work',
  entrance: '4',
  office: '90',
  street: 'Комарова пр.',
)

Address.create(
  city: 'Санкт-Петербург',
  code: '75',
  floor: '6',
  house: '100',
  title: 'home',
  entrance: '2',
  office: '13',
  street: 'пр. Южная',
)

Account.create(
  id: 'eb5378e4-48e6-4d03-b954-d00739b8c8ff',
  name: 'Ilene Pearline Boyle',
  phone: '(409) 941-2819',
  email: 'domenick@padberg.io',
  address_ids: Address.pluck(:id),
  created_at: '2017-10-17T04:42:52.790Z',
  updated_at: '2017-10-17T04:42:52.790Z',
)

Order.create(
  # id: SecureRandom.uuid,
  account_id: Account.first.id,
  address_info: Address.first,
  company_id: Company.first.id,
  status_id: Statuses::NEW,
  delivery_time: '15:00',
  total_cost: 230,
)

OrderProduct.create(
  order_id: Order.first.id,
  product_id: Product.first.id,
  main_option: 'beef',
  ingredients: [
    qty: 2,
    name: '🥗 salad',
  ],
)
