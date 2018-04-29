# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Company.delete_all
OrderToken.delete_all
OrderProduct.delete_all
Order.delete_all
Product.delete_all
Category.delete_all
CompanySchedule.delete_all
Account.delete_all
Address.delete_all
Status.delete_all

Status.create(id: 10_010, name: 'Новый', position: 1)
Status.create(id: 10_020, name: 'Подтвержден', position: 2)
Status.create(id: 10_030, name: 'Отменен', position: 3)

	# Address.create(
	#   city: 'Астрахань',
	#   code: '71',
	#   floor: '4',
	#   house: '144',
	#   title: 'work',
	#   entrance: '4',
	#   office: '90',
	#   street: 'Комарова пр.',
	# )
	#
	# Address.create(
	#   city: 'Санкт-Петербург',
	#   code: '75',
	#   floor: '6',
	#   house: '100',
	#   title: 'home',
	#   entrance: '2',
	#   office: '13',
	#   street: 'пр. Южная',
	# )
	#
	# Account.create(
	#   id: 'eb5378e4-48e6-4d03-b954-d00739b8c8ff',
	#   name: 'Ilene Pearline Boyle',
	#   phone: '(409) 941-2819',
	#   email: 'domenick@padberg.io',
	#   address_ids: Address.pluck(:id),
	#   created_at: '2017-10-17T04:42:52.790Z',
	#   updated_at: '2017-10-17T04:42:52.790Z',
	# )
	#
	# Order.create(
	#   # id: SecureRandom.uuid,
	#   account_id: Account.first.id,
	#   address_info: Address.first,
	#   company_id: Company.first.id,
	#   status_id: Statuses::NEW,
	#   delivery_time: '15:00',
	#   total_cost: 230,
	# )
	#
	# OrderProduct.create(
	#   order_id: Order.first.id,
	#   product_id: Product.first.id,
	#   main_option: 'beef',
	# 	total_cost: 230,
	#   ingredients: [
	#     qty: 2,
	#     name: '🥗 salad',
	# 		total_cost: 100,
	#   ],
	# )
	#
	# OrderProduct.create(
	#   order_id: Order.first.id,
	#   product_id: Product.second.id,
	#   main_option: 'XL - 325 гр',
	# 	total_cost: 590,
	#   ingredients: [
	#     {
	# 			qty: 5,
	#     	name: '🌶 Халапеньо',
	# 			total_cost: 50,
	# 		},
	# 		{
	# 			qty: 2,
	#     	name: '🥗 Салат Коул слоу (200 гр)',
	# 			total_cost: 150,
	# 		},
	# 	],
	# )
#
# OrderToken.create(order_id: Order.first.id, token: SecureRandom.urlsafe_base64(256))
