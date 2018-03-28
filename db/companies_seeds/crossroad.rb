categories = []

categories << Category.find_or_create_by(name: 'Пицца', icon_type: 'icon_burger', description: '').id
categories << Category.find_or_create_by(name: 'Роллы Норимаки', icon_type: 'icon_wing', description: '').id
categories << Category.find_or_create_by(name: 'Роллы Саимаки', icon_type: 'icon_leg', description: '').id
categories << Category.find_or_create_by(name: 'Горячие Роллы', icon_type: 'icon_kebab', description: '').id
categories << Category.find_or_create_by(name: 'Запеченные Роллы', icon_type: 'icon_chips', description: '').id

company_addresses = []

company_addresses << Address.create(
                        title: 'Crossroad',
                        city: 'Хабаровск',
                        street: 'ул. Ленинградская',
                        house: '28к2').id

company = Company.find_or_initialize_by(name: 'Crossroad')

company.update(categories: categories,
							 description: "В Crossroad вас всегда ждет теплая, \nгостеприимная атмосфера. Здесь собираются ценители качественных напитков и \nпревосходных блюд, любители живой музыки и, конечно, \nспортивные болельщики.",
							 delivery: { cost: 150, free_shipping: 800, pickup_discount: 10, period: { start: '12:00 +10', end: '19:30 +10' } },
							 contact_info: { phone: '+7 (4212) 94-13-13', email: 'crossroadbar@mail.ru', geotag: ["48.469463,135.071622"], geotag_cafe: ["48.483257,135.094393"] },
               address_ids: company_addresses)

company_id = company.id

CompanySchedule.create(
  company_id: company_id,
	week_day: 'sun',
	time_start: '13:00:00+10',
	time_end: '21:00:00+10'
)
CompanySchedule.create(
  company_id: company_id,
	week_day: 'mon',
	time_start: nil,
	time_end: nil
)
CompanySchedule.create(
  company_id: company_id,
	week_day: 'tue',
	time_start: '12:00:00+10',
	time_end: '21:00:00+10'
)
CompanySchedule.create(
  company_id: company_id,
	week_day: 'wed',
	time_start: '12:00:00+10',
	time_end: '21:00:00+10'
)
CompanySchedule.create(
  company_id: company_id,
	week_day: 'thu',
	time_start: '12:00:00+10',
	time_end: '21:00:00+10'
)
CompanySchedule.create(
  company_id: company_id,
	week_day: 'fri',
	time_start: '12:00:00+10',
	time_end: '21:00:00+10'
)
CompanySchedule.create(
  company_id: company_id,
	week_day: 'sat',
	time_start: '12:00:00+10',
	time_end: '21:00:00+10'
							 )

# Пицца
Product.create(
	category_id: Category.find_by_name("Пицца").id,
	company_id: company_id,
	title: 'Пицца с салями',
	brief: 'Короткое описание продукта, плюс ингредиенты. Колбаса “Салями”, копченая паприка, помидоры, сыр Моцарелла, томатный соус',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Колбаса “Салями”, копченая паприка, помидоры, сыр Моцарелла, томатный соус',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-1.png',
	main_options: [{ name: '488 гр', cost: 450 }],
)
Product.create(
	category_id: Category.find_by_name("Пицца").id,
	company_id: company_id,
	title: 'Пицца с беконом и болгарским перцем',
	brief: 'Короткое описание продукта, плюс ингредиенты. Бекон, перец болгарский, копченая паприка, сыр Моцарелла, томатный соус',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Бекон, перец болгарский, копченая паприка, сыр Моцарелла, томатный соус',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-2.png',
	main_options: [{ name: '488 гр', cost: 510 }],
)
Product.create(
	category_id: Category.find_by_name("Пицца").id,
	company_id: company_id,
	title: 'Пицца «Моноло Ривьера»',
	brief: 'Короткое описание продукта, плюс ингредиенты. Куриное филе, черри, лук, копченая паприка, сыр Моцарелла, сливочный соус',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Куриное филе, черри, лук, копченая паприка, сыр Моцарелла, сливочный соус',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-3.png',
	main_options: [{ name: '588 гр', cost: 480 }],
)
Product.create(
	category_id: Category.find_by_name("Пицца").id,
	company_id: company_id,
	title: 'Пицца “Виладжио”',
	brief: 'Короткое описание продукта, плюс ингредиенты. Мясокопчёности, ветчина, корнишоны, помидоры, зелень, сыр Моцарелла, томатный соус',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Мясокопчёности, ветчина, корнишоны, помидоры, зелень, сыр Моцарелла, томатный соус',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-4.png',
	main_options: [{ name: '488 гр', cost: 390 }],
)
Product.create(
	category_id: Category.find_by_name("Пицца").id,
	company_id: company_id,
	title: 'Пицца «Фунго ди порчини»',
	brief: 'Короткое описание продукта, плюс ингредиенты. Куриное филе, шампиньоны, копченая паприка, сыр Моцарелла, сливочный соус',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Куриное филе, шампиньоны, копченая паприка, сыр Моцарелла, сливочный соус',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-5.png',
	main_options: [{ name: '438 гр', cost: 510 }],
)
Product.create(
	category_id: Category.find_by_name("Пицца").id,
	company_id: company_id,
	title: 'Пицца с ветчиной и грибами',
	brief: 'Короткое описание продукта, плюс ингредиенты. Ветчина, шампиньоны, копченая паприка, сыр Моцарелла, томатный соус',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Ветчина, шампиньоны, копченая паприка, сыр Моцарелла, томатный соус',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-6.png',
	main_options: [{ name: '488 гр', cost: 510 }],
)
Product.create(
	category_id: Category.find_by_name("Пицца").id,
	company_id: company_id,
	title: 'Пицца с языком и баклажанами',
	brief: 'Короткое описание продукта, плюс ингредиенты. Телячий язык, ветчина Парма, помидоры, баклажан, сыр Моцарелла, сливочный соус',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Телячий язык, ветчина Парма, помидоры, баклажан, сыр Моцарелла, сливочный соус',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-7.png',
	main_options: [{ name: '498 гр', cost: 520 }],
)
Product.create(
	category_id: Category.find_by_name("Пицца").id,
	company_id: company_id,
	title: 'Пицца «Пепероне»',
	brief: 'Короткое описание продукта, плюс ингредиенты. Пепероне, цуккини, копченая паприка, помидоры, сыр Моцарелла, томатный соус',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Пепероне, цуккини, копченая паприка, помидоры, сыр Моцарелла, томатный соус',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-8.png',
	main_options: [{ name: '488 гр', cost: 450 }],
)
Product.create(
	category_id: Category.find_by_name("Пицца").id,
	company_id: company_id,
	title: 'Пицца «Четыре сыра»',
	brief: 'Короткое описание продукта, плюс ингредиенты. Сыры: Дорблю, Пекорино Романо, Моцарелла, Пармезан, томатный соус',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Сыры: Дорблю, Пекорино Романо, Моцарелла, Пармезан, томатный соус',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-9.png',
	main_options: [{ name: '488 гр', cost: 470 }],
)
Product.create(
	category_id: Category.find_by_name("Пицца").id,
	company_id: company_id,
	title: 'Пицца “Грибная”',
	brief: 'Короткое описание продукта, плюс ингредиенты. Пассированные на сливочном масле грибы, лук, помидор, сыр Моцарелла, сливочный соус',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Пассированные на сливочном масле грибы, лук, помидор, сыр Моцарелла, сливочный соус',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-10.png',
	main_options: [{ name: '478 гр', cost: 450 }],
)
Product.create(
	category_id: Category.find_by_name("Пицца").id,
	company_id: company_id,
	title: 'Пицца «Аррабиата»',
	brief: 'Короткое описание продукта, плюс ингредиенты. Цуккини, копченые колбаски, копченая паприка, сыр Моцарелла, соус Тобаско, томатный соус',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Цуккини, копченые колбаски, копченая паприка, сыр Моцарелла, соус Тобаско, томатный соус',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-11.png',
	main_options: [{ name: '428 гр', cost: 430 }],
)
Product.create(
	category_id: Category.find_by_name("Пицца").id,
	company_id: company_id,
	title: 'Пицца с лососем и угрём',
	brief: 'Короткое описание продукта, плюс ингредиенты. Копчёный угорь, лосось, копченая паприка, сыр Моцарелла, сливочный соус',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Копчёный угорь, лосось, копченая паприка, сыр Моцарелла, сливочный соус',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-12.png',
	main_options: [{ name: '458 гр', cost: 550 }],
)
Product.create(
	category_id: Category.find_by_name("Пицца").id,
	company_id: company_id,
	title: 'Пицца «Капасанта»',
	brief: 'Короткое описание продукта, плюс ингредиенты. Гребешок, креветка, черри, оливки, копченая паприка, сыр Моцарелла, сливочный соус',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Гребешок, креветка, черри, оливки, копченая паприка, сыр Моцарелла, сливочный соус',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-13.png',
	main_options: [{ name: '588 гр', cost: 710 }],
)

# Роллы Норимаки
Product.create(
	category_id: Category.find_by_name("Роллы Норимаки").id,
	company_id: company_id,
	title: 'Маки Угорь',
	brief: 'Короткое описание продукта, плюс ингредиенты. Рис, нори, копчёный угорь, сыр Буко',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Рис, нори, копчёный угорь, сыр Буко',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/roll-1.jpg',
	main_options: [{ name: '158 гр', cost: 270 }],
)
Product.create(
	category_id: Category.find_by_name("Роллы Норимаки").id,
	company_id: company_id,
	title: 'Маки Лосось',
	brief: 'Короткое описание продукта, плюс ингредиенты. Рис, нори, лосось, сыр Буко',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Рис, нори, лосось, сыр Буко',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/roll-2.jpg',
	main_options: [{ name: '158 гр', cost: 250 }],
)
Product.create(
	category_id: Category.find_by_name("Роллы Норимаки").id,
	company_id: company_id,
	title: 'Маки Огурец',
	brief: 'Короткое описание продукта, плюс ингредиенты. Рис, нори, огурец, сыр Буко',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Рис, нори, огурец, сыр Буко',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/roll-3.jpg',
	main_options: [{ name: '158 гр', cost: 160 }],
)

# Роллы Саимаки
Product.create(
	category_id: Category.find_by_name("Роллы Саимаки").id,
	company_id: company_id,
	title: 'Ролл “Эби”',
	brief: 'Короткое описание продукта, плюс ингредиенты. Рис, нори, сыр Буко, салат, креветка в кунжуте',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Рис, нори, сыр Буко, салат, креветка в кунжуте',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/roll-4.jpg',
	main_options: [{ name: '238 гр', cost: 360 }],
)
Product.create(
	category_id: Category.find_by_name("Роллы Саимаки").id,
	company_id: company_id,
	title: 'Ролл “Цезарь”',
	brief: 'Короткое описание продукта, плюс ингредиенты. Рис, нори, куриная грудка, помидор, соус цезарь, микс салата, сыр Пармезан',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Рис, нори, куриная грудка, помидор, соус цезарь, микс салата, сыр Пармезан',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/roll-5.jpg',
	main_options: [{ name: '238 гр', cost: 330 }],
)
Product.create(
	category_id: Category.find_by_name("Роллы Саимаки").id,
	company_id: company_id,
	title: 'Ролл “Харумаки”',
	brief: 'Короткое описание продукта, плюс ингредиенты. Харумаки, кальмар, сурими, тобико, соус Спайси',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Харумаки, кальмар, сурими, тобико, соус Спайси',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/roll-6.jpg',
	main_options: [{ name: '248 гр', cost: 330 }],
)
Product.create(
	category_id: Category.find_by_name("Роллы Саимаки").id,
	company_id: company_id,
	title: 'Ролл “Филадельфия”',
	brief: 'Короткое описание продукта, плюс ингредиенты. Рис, нори, лосось, сыр Буко, огурец, тобико',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Рис, нори, лосось, сыр Буко, огурец, тобико',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/roll-7.jpg',
	main_options: [{ name: '248 гр', cost: 360 }],
)
Product.create(
	category_id: Category.find_by_name("Роллы Саимаки").id,
	company_id: company_id,
	title: 'Ролл “Ясай”',
	brief: 'Короткое описание продукта, плюс ингредиенты. Рис, нори, огурец, сладкий перец, помидор, салат',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Рис, нори, огурец, сладкий перец, помидор, салат',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/roll-8.jpg',
	main_options: [{ name: '288 гр', cost: 240 }],
)
Product.create(
	category_id: Category.find_by_name("Роллы Саимаки").id,
	company_id: company_id,
	title: 'Ролл “Калифорния”',
	brief: 'Короткое описание продукта, плюс ингредиенты. Рис, нори, огурец, сыр Буко, лосось, тобико',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Рис, нори, огурец, сыр Буко, лосось, тобико',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/roll-9.jpg',
	main_options: [{ name: '288 гр', cost: 370 }],
)
Product.create(
	category_id: Category.find_by_name("Роллы Саимаки").id,
	company_id: company_id,
	title: 'Ролл “Красный Дракон”',
	brief: 'Короткое описание продукта, плюс ингредиенты. Рис, нори, огурец, блин омай, сыр Буко, угорь, тобико',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Рис, нори, огурец, блин омай, сыр Буко, угорь, тобико',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/roll-10.jpg',
	main_options: [{ name: '248 гр', cost: 350 }],
)
Product.create(
	category_id: Category.find_by_name("Роллы Саимаки").id,
	company_id: company_id,
	title: 'Ролл “Золотой Дракон”',
	brief: 'Короткое описание продукта, плюс ингредиенты. Рис, нори, огурец, блин омай, сыр Буко, угорь',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Рис, нори, огурец, блин омай, сыр Буко, угорь',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/roll-11.jpg',
	main_options: [{ name: '248 гр', cost: 390 }],
)

# Горячие Роллы
Product.create(
	category_id: Category.find_by_name("Горячие Роллы").id,
	company_id: company_id,
	title: 'Ролл “Кроссроад”',
	brief: 'Короткое описание продукта, плюс ингредиенты. Рис, нори, форель, угорь, авокадо, огурец, темпура',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Рис, нори, форель, угорь, авокадо, огурец, темпура',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/roll-12.jpg',
	main_options: [{ name: '238 гр', cost: 440 }],
)
Product.create(
	category_id: Category.find_by_name("Горячие Роллы").id,
	company_id: company_id,
	title: 'Ролл “Фудзияма”',
	brief: 'Короткое описание продукта, плюс ингредиенты. Рис, нори, лосось, тунец, сыр Буко, темпура, огурец',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Рис, нори, лосось, тунец, сыр Буко, темпура, огурец',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/roll-13.jpg',
	main_options: [{ name: '238 гр', cost: 340 }],
)
Product.create(
	category_id: Category.find_by_name("Горячие Роллы").id,
	company_id: company_id,
	title: 'Ролл “Йокодзуна”',
	brief: 'Короткое описание продукта, плюс ингредиенты. Рис, нори, соус Унаги, соус Спайси, филе горбуши, грибы шиитаке, темпура',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Рис, нори, соус Унаги, соус Спайси, филе горбуши, грибы шиитаке, темпура',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/roll-14.jpg',
	main_options: [{ name: '238 гр', cost: 290 }],
)

# Запеченные Роллы
Product.create(
	category_id: Category.find_by_name("Запеченные Роллы").id,
	company_id: company_id,
	title: 'Ролл “Токио”',
	brief: 'Короткое описание продукта, плюс ингредиенты. Рис, нори, тунец, сыр Буко, блин Омай, огурец, Сыр пармезан, тобико, соус Спайси',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Рис, нори, тунец, сыр Буко, блин Омай, огурец, Сыр пармезан, тобико, соус Спайси',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/roll-15.jpg',
	main_options: [{ name: '248 гр', cost: 390 }],
)
Product.create(
	category_id: Category.find_by_name("Запеченные Роллы").id,
	company_id: company_id,
	title: 'Ролл “Иокогама”',
	brief: 'Короткое описание продукта, плюс ингредиенты. Рис, нори, копчёный угорь, блин Омай, огурец, сыр Пармезан, сыр Буко , тобико, соус Спайси',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Рис, нори, копчёный угорь, блин Омай, огурец, сыр Пармезан, сыр Буко , тобико, соус Спайси',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/roll-16.jpg',
	main_options: [{ name: '248 гр', cost: 420 }],
)
Product.create(
	category_id: Category.find_by_name("Запеченные Роллы").id,
	company_id: company_id,
	title: 'Ролл “Осака”',
	brief: 'Короткое описание продукта, плюс ингредиенты. Рис, нори, кальмар, сыр Буко, блин Омай, огурец, сыр Пармезан, тобико, соус Спайси',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Рис, нори, кальмар, сыр Буко, блин Омай, огурец, сыр Пармезан, тобико, соус Спайси',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/roll-17.jpg',
	main_options: [{ name: '248 гр', cost: 370 }],
)
Product.create(
	category_id: Category.find_by_name("Запеченные Роллы").id,
	company_id: company_id,
	title: 'Ролл “Нагоя”',
	brief: 'Короткое описание продукта, плюс ингредиенты. Рис, нори, горбуша, сыр Буко, блин Омай, огурец, сыр Пармезан, тобико, соус Спайси',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Рис, нори, горбуша, сыр Буко, блин Омай, огурец, сыр Пармезан, тобико, соус Спайси',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/roll-18.jpg',
	main_options: [{ name: '248 гр', cost: 340 }],
)
Product.create(
	category_id: Category.find_by_name("Запеченные Роллы").id,
	company_id: company_id,
	title: 'Ролл “Саппоро”',
	brief: 'Короткое описание продукта, плюс ингредиенты. Рис, нори, окунь, сыр Буко, блин Омай, огурец, сыр Пармезан, тобико, соус Спайси.',
	description: 'Более полное описание, со всеми подробностями, отзывами, интересными вещами и тд. Плюс опять же ингредиенты: Рис, нори, окунь, сыр Буко, блин Омай, огурец, сыр Пармезан, тобико, соус Спайси.',
	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/roll-19.jpg',
	main_options: [{ name: '248 гр', cost: 340 }],
)
