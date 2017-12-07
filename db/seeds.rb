# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

OrderProduct.delete_all
Order.delete_all
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
Category.create(name: 'Крылышки', icon_type: 'icon_wing', description: '')
Category.create(name: 'Ножки', icon_type: 'icon_leg', description: '')
Category.create(name: 'Картофель фри и чипсы', icon_type: 'icon_chips', description: '')
Category.create(name: 'Салаты', icon_type: 'icon_salat', description: '')
Category.create(name: 'Соусы', icon_type: 'icon_sauce', description: '')
Category.create(name: 'Супы', icon_type: 'icon_soup', description: '')
Category.create(name: 'Напитки', icon_type: 'icon_drinks', description: '')
Category.create(name: 'Наборы', icon_type: 'icon_set', description: '')

Company.create(name: 'ИП Свиридов Ф.Т.',
							 categories: Category.pluck(:id),
							 description: "ChiXX – это команда единомышленников, которые любят и умеют готовить.\nНаша цель – предложить Вам лучшие рецепты из самых деликатесных частей курицы. Все наши блюда готовятся вручную, вкусно, быстро и с душой. Используем только свежие продукты и очень внимательно относимся к процессу приготовления.\nМы уверены, что наш проект поможет Вам разнообразить привычную палитру готовых блюд, которая предлагается в нашем городе.\nЗакажите прямо сейчас и в кратчайшие сроки восхитительные блюда окажутся на Вашем столе!",
							 delivery: { cost: 150, free_shipping: 800, pickup_discount: 10, period: { start: '12:00 +10', end: '19:30 +10' } },
							 contact_info: { phone: '+7 (4212) 77-60-25', email: 'info@chixx.ru', geotag: ["48.483257,135.094393","48.469463,135.071622"] })

Product.create(
	category_id: Category.first.id,
	company_id: Company.first.id,
	title: 'Бульдог XL',
	brief: 'Пожалуй, самый большой бургер в городе, практически полкило чистой массы!',
	description: 'Пожалуй, самый большой бургер в городе, практически полкило чистой массы! Две восхитительные котлеты, восхитительный хрустящий бекон, двойной сыр, салатные листья, свежие томаты, огурец, красный лук, но самое главное - великолепный соус гриль и наш фирменный карамелизированный соус с ворчестером! Вряд ли вы осилите Бульдога в одиночку :)',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/burger_buldog.png',
	main_options: [{ name: 'Курица - 440 гр', cost: 480 },{ name: 'Говядина - 430 гр', cost: 550 }],
	additional_info: [{ name: '🥗 Салат Коул слоу (200 гр)', cost: 75 }],
)
Product.create(
	category_id: Category.first.id,
	company_id: Company.first.id,
	title: 'Aloha! М',
	brief: 'Запоминающееся сочетание: гриль котлета + ананас, на выбор говяжья или куриная',
	description: 'Запоминающееся сочетание: гриль котлета + ананас, на выбор говяжья или куриная :) Листья салата, сыр чеддер и наш фирменный пикантный соус "Баффало"! Удивительное сочетание вкусов! Дополните салатом Коул слоу по выгодной цене!',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/burger_aloha.png',
	main_options: [{ name: 'Курица - 195 гр', cost: 200 },{ name: 'Говядина - 185 гр', cost: 210 }],
	additional_info: [{ name: '🥗 Салат Коул слоу (200 гр)', cost: 75 }],
)
Product.create(
	category_id: Category.first.id,
	company_id: Company.first.id,
	title: 'Чикен XL',
	brief: 'Кунжутная булочка и ароматная куриная котлета!',
	description: 'Кунжутная булочка и ароматная куриная котлета! Маринованные огурцы, листы салата, ломтик сыра, помидоры - всё это стало еще вкуснее благодаря гриль соусу. Попробуйте и влюбитесь! Дополните салатом Коул слоу по приятной цене!',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/burger_chiken.png',
	main_options: [{ name: 'Курица - 290 гр', cost: 290 }],
	additional_info: [{ name: '🥗 Салат Коул слоу (200 гр)', cost: 75 }],
)
Product.create(
	category_id: Category.first.id,
	company_id: Company.first.id,
	title: 'Баффало XL',
	brief: 'Первый в Хабаровске Баффало бургер порадует увесистой, сочной куриной котлетой в фирменном островатом соусе Баффало.',
	description: 'Первый в Хабаровске Баффало бургер порадует увесистой, сочной куриной котлетой в фирменном островатом соусе Баффало. Кладем свежий томат, салатный лист, маринованные огурчики кольцами и ломтики благородного голубого сыра. Дополните салатом Коул слоу по приятной цене!',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/burger_baffalo.png',
	main_options: [{ name: 'Курица - 290 гр', cost: 350 }],
	additional_info: [{ name: '🥗 Салат Коул слоу (200 гр)', cost: 75 }],
)
Product.create(
	category_id: Category.first.id,
	company_id: Company.first.id,
	title: 'Чикен-гриль XL',
	brief: 'Кунжутная булочка с сочной куриной котлетой и сыром чеддер, свежие листы салата, обжаренный на гриле баклажан, томат и шампиньоны.',
	description: 'Кунжутная булочка с сочной куриной котлетой и сыром чеддер, свежие листы салата, обжаренный на гриле баклажан, томат и шампиньоны. Главный ингредиент - карамелизированный соус с ворчестером и соус барбекю! Дополните салатом Коул слоу по приятной цене!',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/burger_chiken_grill.png',
	main_options: [{ name: 'Курица - 320 гр', cost: 370 }],
	additional_info: [{ name: '🥗 Салат Коул слоу (200 гр)', cost: 75 }],
)
Product.create(
	category_id: Category.first.id,
	company_id: Company.first.id,
	title: 'С яйцом XL',
	brief: 'Великолепное и сытное сочетание: кунжутная булочка, жареное яйцо, большая куриная котлета в панировке, насыщенный соус.',
	description: 'Великолепное и сытное сочетание: кунжутная булочка, жареное яйцо, большая куриная котлета в панировке, насыщенный соус, томаты и свежие листья салата. Дополните салатом Коул слоу по приятной цене!',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/burger_egg.png',
	main_options: [{ name: 'Курица - 320 гр', cost: 330 }],
	additional_info: [{ name: '🥗 Салат Коул слоу (200 гр)', cost: 75 }],
)
Product.create(
	category_id: Category.second.id,
	company_id: Company.first.id,
	title: 'Кентукки Криспи',
	brief: 'Крылышки Кентукки в новом хрустящем исполнении!',
	description: 'Крылышки Кентукки в новом хрустящем исполнении! Маринуются по рецепту ChiXX в натуральных травах и специях. Обладают лёгкой и приятной остринкой. Рекомендуем брать с соусами Сырным или Барбекю!',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/wings_kentuki.png',
	main_options: [{ name: '8 шт - 340 гр', cost: 340 },{ name: '14 шт - 600 гр', cost: 510 }],
	)
Product.create(
	category_id: Category.second.id,
	company_id: Company.first.id,
	title: 'Крылышки Баффало',
	brief: 'Одно из самых культовых блюд Америки! Неповторимые куриные крылышки, мягкие, сочные, обжаренные и покрытые соусом.',
	description: 'Одно из самых культовых блюд Америки! Неповторимые куриные крылышки, мягкие, сочные, обжаренные и покрытые соусом, который и придает им традиционный островатый вкус. Соус приготовлен на основе томатной пасты, с добавлением трав и кайенского перца.',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/wings_baffalo.png',
	main_options: [{ name: '8 шт - 370 гр', cost: 340 },{ name: '14 шт - 600 гр', cost: 510 }],
	)
Product.create(
	category_id: Category.second.id,
	company_id: Company.first.id,
	title: 'Медово-горчичные',
	brief: 'Крылышки тщательно маринуем и обжариваем до золотистой корочки, затем оборачиваем в медово-горчичный соус домашнего приготовления.',
	description: 'Крылышки тщательно маринуем и обжариваем до золотистой корочки, затем оборачиваем в медово-горчичный соус домашнего приготовления. Блюдо становится нежно-сладковатого вкуса, с нотками горчицы и имбиря. Крылышки получаются мягкие и сочные, с приятным ароматом.',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/wings_honny.png',
	main_options: [{ name: '8 шт - 370 гр', cost: 340 },{ name: '14 шт - 590 гр', cost: 510 }],
	)
Product.create(
	category_id: Category.second.id,
	company_id: Company.first.id,
	title: 'Бурбон Барбекю',
	brief: 'Сочные и увесистые крылышки маринуем в смеси ChiXX из специй и трав, обжариваем до золотистой корочки и пропитываем насыщенным соусом.',
	description: 'Сочные и увесистые крылышки маринуем в смеси ChiXX из специй и трав, обжариваем до золотистой корочки и пропитываем насыщенным соусом на основе бурбона, томатной пасты и коричневого сахара. Крылышки получаются мягкие, приобретают аромат жарки на гриле и свойственные бурбону нотки чернослива.',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/wings_bbq.png',
	main_options: [{ name: '8 шт - 370 гр', cost: 340 },{ name: '14 шт - 590 гр', cost: 510 }],
	)
Product.create(
	category_id: Category.second.id,
	company_id: Company.first.id,
	title: 'Шрирача Hot!',
	brief: 'НОВИНКА! Крылья Шрирача порадуют пронзительно огненным острым вкусом, тщательно промаринованные и обжаренные!',
	description: 'НОВИНКА! Крылья Шрирача порадуют пронзительно огненным острым вкусом, тщательно промаринованные и обжаренные, они отлично подойдут любителям блюд "погорячее"! Пикантный соус шрирача на основе перца чили и чеснока проникает в крылышки до самых косточек и вряд ли даст вам заскучать!',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/wings_shiracha.png',
	main_options: [{ name: '8 шт - 370 гр', cost: 340 },{ name: '14 шт - 600 гр', cost: 510 }],
	)
Product.create(
	category_id: Category.second.id,
	company_id: Company.first.id,
	title: 'Терияки',
	brief: 'Крылышки маринуются, обжариваются и покрываются нашим фирменным Терияки соусом.',
	description: 'Крылышки маринуются, обжариваются и покрываются нашим фирменным Терияки соусом. Блюдо обладает насыщенным вкусом и ароматом благодаря сочетанию соевого соуса, меда и семян кунжута. Крылышки получаются мягкие и сочные, с приятным сладковатым привкусом.',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/wings_tereyaki.png',
	main_options: [{ name: '8 шт - 370 гр', cost: 340 },{ name: '14 шт - 590 гр', cost: 510 }],
	)
Product.create(
	category_id: Category.third.id,
	company_id: Company.first.id,
	title: 'Баффало',
	brief: 'Куриные ножки, мягкие, сочные, обжаренные и покрытые соусом, который и придает им традиционный островатый вкус.',
	description: 'Куриные ножки, мягкие, сочные, обжаренные и покрытые соусом, который и придает им традиционный островатый вкус. Соус приготовлен на основе томатной пасты с добавлением кайенского перца.',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/legs_baffalo.png',
	main_options: [{ name: '3-4 шт - 370 гр', cost: 340 },{ name: '5-6 шт - 580 гр', cost: 510 }],
	)
Product.create(
	category_id: Category.fourth.id,
	company_id: Company.first.id,
	title: 'Картофель дольками',
	brief: 'Картофель, порезанный дольками, обжаренный до золотистой корочки и слегка посыпанный специями.',
	description: 'Картофель, порезанный дольками, обжаренный до золотистой корочки и слегка посыпанный специями - вкусное и сочное дополнение к крыльям и ножкам!',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/potato_dolki-min.png',
	main_options: [{ name: '180 гр', cost: 110 }],
	)
Product.create(
	category_id: Category.fourth.id,
	company_id: Company.first.id,
	title: 'Картофель фри',
	brief: 'Классический картофель фри, порезанный соломкой, обладающий золотистым цветом.',
	description: 'Классический картофель фри, порезанный соломкой, обладающий золотистым цветом. Присыпается специями. Отлично сочетается с любым из соусов на ваш выбор.',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/potato_frii-min.png',
	main_options: [{ name: '140 гр', cost: 95 }],
	)
Product.create(
	category_id: Category.fourth.id,
	company_id: Company.first.id,
	title: 'Луковые кольца',
	brief: 'Нежные и хрустящие луковые кольца обжариваются до золотистой корочки.',
	description: 'Нежные и хрустящие луковые кольца обжариваются до золотистой корочки. Вкус блюда еще лучше оттеняется кисло-сладким или чесночным соусом!',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/onion-min.png',
	main_options: [{ name: '10 шт', cost: 120 }],
	)
Product.create(
	category_id: Category.fourth.id,
	company_id: Company.first.id,
	title: 'Хашбраунс',
	brief: 'НОВИНКА! Порция золотистых хрустящих картофельных хэшбраунс.',
	description: 'НОВИНКА! Порция золотистых хрустящих картофельных хэшбраунс. Приятный вкус жареной картошечки с луком!',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/hashbrauns-min.png',
	main_options: [{ name: '4 шт', cost: 120 }],
	)
Product.create(
	category_id: Category.fourth.id,
	company_id: Company.first.id,
	title: 'Картофельные чипсы',
	brief: 'Чипсы "Классические" (почти без соли).',
	description: 'Хрустящая закуска, предлагаем чипсы "Классические" (почти без соли), которые можно дополнить любым соусом на ваш вкус.',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/chips-min.png',
	main_options: [{ name: 'Классик, 50 гр', cost: 70 }, { name: 'Классик, 100 гр', cost: 130 }],
	)
Product.create(
	category_id: Category.fourth.id,
	company_id: Company.first.id,
	title: 'Сырные палочки',
	brief: 'Хрустящая, излюбленная многими закуска, с нежным сыром Моцарелла внутри.',
	description: 'Хрустящая, излюбленная многими закуска, с нежным сыром Моцарелла внутри. Палочки обжарены до золотистой корочки. Еще вкуснее с чесночным или Барбекю соусом!',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/cheese_tiks-min.png',
	main_options: [{ name: '5 шт (~165 гр)', cost: 230 }],
	)
Product.create(
	category_id: Category.fifth.id,
	company_id: Company.first.id,
	title: 'Коул слоу',
	brief: 'Легкий салат с основой из свежей моркови, капусты, заправляем сметанным соусом с винным уксусом.',
	description: 'Легкий салат с основой из свежей моркови, капусты, заправляем сметанным соусом с винным уксусом и добавлением классической горчицы и черного перца. Идеален в качестве закуски для бургеров и горячих блюд.',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/salat_koul-min.png',
	main_options: [{ name: '200 гр', cost: 90 }],
	)
Product.create(
	category_id: Category.find_by_name("Соусы").id,
	company_id: Company.first.id,
	title: 'Сальса',
	brief: 'Традиционный мексиканский соус на томатной основе.',
	description: 'Традиционный мексиканский соус на томатной основе. Сладко-острый соус с кусочками красной паприки, чеснока и смеси «Тех-Мех» специй. Идеален в качестве дип-соуса к гарнирам и горячим блюдам - тортильям, чипсам, начос.',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/souce_salsa-min.png',
	main_options: [{ name: '60 мл', cost: 60 }],
	)
Product.create(
	category_id: Category.find_by_name("Соусы").id,
	company_id: Company.first.id,
	title: 'Блю чиз',
	brief: 'Традиционный соус на основе благородного голубого сыра, фреш крема и белого перца.',
	description: 'Традиционный соус на основе благородного голубого сыра, фреш крема и белого перца. Для насыщенного вкуса комочки сыра специально не измельчаются.',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/souce_blue-min.png',
	main_options: [{ name: '60 мл', cost: 90 }],
	)
Product.create(
	category_id: Category.find_by_name("Соусы").id,
	company_id: Company.first.id,
	title: 'Горчичный',
	brief: 'Пряно-горчичный соус, на основе подсолнечного масла, желтков, семян горчицы и специй.',
	description: 'Пряно-горчичный соус, на основе подсолнечного масла, желтков, семян горчицы и специй. Придает блюду пикантный вкус и остроту, вносит медовую нотку.',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/souce_dijon-min.png',
	main_options: [{ name: '60 мл', cost: 60 }],
	)
Product.create(
	category_id: Category.find_by_name("Соусы").id,
	company_id: Company.first.id,
	title: 'Сырный',
	brief: 'Соус с насыщенным, ярким вкусом и ароматом.',
	description: 'Соус с насыщенным, ярким вкусом и ароматом, специально для любителей сыра.',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/souce_cheese-min.png',
	main_options: [{ name: '60 мл', cost: 60 }],
	)
Product.create(
	category_id: Category.find_by_name("Соусы").id,
	company_id: Company.first.id,
	title: 'Барбекю (BBQ)',
	brief: 'Классический соус',
	description: 'Классический соус великолепно передает вкус и аромат приготовления на гриле.',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/souce_bbq-min.png',
	main_options: [{ name: '60 мл', cost: 60 }],
	)
Product.create(
	category_id: Category.find_by_name("Соусы").id,
	company_id: Company.first.id,
	title: 'Чесночный',
	brief: 'Классический чесночный соус',
	description: 'Обладает приятным ароматом, умеренной остротой и восхитительно нежным вкусом.',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/souce_garlic-min.png',
	main_options: [{ name: '60 мл', cost: 60 }],
	)
Product.create(
	category_id: Category.find_by_name("Соусы").id,
	company_id: Company.first.id,
	title: '1000 Островов',
	brief: 'Классический соус средиземноморской и американской кухонь.',
	description: 'Классический соус средиземноморской и американской кухонь. Нежный, слегка острый и пряный соус с букетом трав и специй. Идеален для овощных салатов, морских коктейлей и бургеров.',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/souce_1000-min.png',
	main_options: [{ name: '60 мл', cost: 60 }],
	)
Product.create(
	category_id: Category.find_by_name("Соусы").id,
	company_id: Company.first.id,
	title: 'Кетчуп',
	brief: 'Классический кетчупа HEINZ.',
	description: 'Классический кетчупа HEINZ, обладает густой консистенции и насыщенным вкусом томатов. Подходит практически для любого блюда.',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/souce_ketchup-min.png',
	main_options: [{ name: '60 мл', cost: 50 }],
	)
Product.create(
	category_id: Category.find_by_name("Соусы").id,
	company_id: Company.first.id,
	title: 'Китайский Кисло-сладкий',
	brief: 'Пикантный соус к любому блюду, играющий неожиданными вкусовыми гранями.',
	description: 'Пикантный соус к любому блюду, играющий неожиданными вкусовыми гранями.',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/souce_china-min.png',
	main_options: [{ name: '60 мл', cost: 60 }],
	)
Product.create(
	category_id: Category.find_by_name("Супы").id,
	company_id: Company.first.id,
	title: 'Чили кон карне',
	brief: 'Новинка! HOT!HOT! Чили кон карне -  мясной суп техасской и мексиканской кухонь.',
	description: 'Новинка! HOT!HOT! Чили кон карне -  мясной суп техасской и мексиканской кухонь: говядина, ароматный рис, томаты, красная фасоль и кукуруза, с добавлением перчика чили. Суп очень питательный и запоминающийся! По желанию можно добавить тертый сыр либо сметану.',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/soup_karne-min.png',
	additional_info: [{ name: '🍛 Сметана', cost: 5 }, { name: '🧀 Сыр', cost: 15 }],
	main_options: [{ name: 'Суп - 270 гр', cost: 199 }],
	)
Product.create(
	category_id: Category.find_by_name("Напитки").id,
	company_id: Company.first.id,
	title: '7up',
	brief: 'Великолепная тройка - напитки, давно зарекомендовавшие себя для любого повода.',
	description: 'Великолепная тройка - напитки, давно зарекомендовавшие себя для любого повода.',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/drink_7up-min.png',
	main_options: [{ name: '600 мл', cost: 80 }],
	)
Product.create(
	category_id: Category.find_by_name("Напитки").id,
	company_id: Company.first.id,
	title: 'Mirinda',
	brief: 'Великолепная тройка - напитки, давно зарекомендовавшие себя для любого повода.',
	description: 'Великолепная тройка - напитки, давно зарекомендовавшие себя для любого повода.',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/drink_miranda-min.png',
	main_options: [{ name: '600 мл', cost: 80 }],
	)
Product.create(
	category_id: Category.find_by_name("Напитки").id,
	company_id: Company.first.id,
	title: 'Pepsi',
	brief: 'Великолепная тройка - напитки, давно зарекомендовавшие себя для любого повода.',
	description: 'Великолепная тройка - напитки, давно зарекомендовавшие себя для любого повода.',
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/drink_pepsi-min.png',
	main_options: [{ name: '600 мл', cost: 80 }],
	)
Product.create(
	category_id: Category.find_by_name("Наборы").id,
	company_id: Company.first.id,
	title: 'Wing cет',
	brief: 'Куриные крылышки: Баффало / Кентукки / Медово-горчичные / Бурбон-барбекю, Картофель дольками, Луковые кольца, Луковые кольца',
	description: "Куриные крылышки 4 порции M: Баффало / Кентукки / Медово-горчичные / Бурбон-барбекю\n картофель дольками (2 порции),\n+ Луковые кольца (2 порции),\n+ Соус на выбор (4 шт).",
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/set1-min.png',
	main_options: [{ name: 'Wing cет', cost: 1770 }],
	)
Product.create(
	category_id: Category.find_by_name("Наборы").id,
	company_id: Company.first.id,
	title: 'Burger сет',
	brief: 'В состав сета входят 4 больших бургера: Чикен / Классик, Салат Коул слоу, Картофель дольками',
	description: "В состав сета входят 4 больших бургера: Чикен / Классик,\n+ Салат Коул слоу (4 порции),\n+ Картофель дольками (2 порции)",
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/set2-min.png',
	main_options: [{ name: 'Burger сет', cost: 1610 }],
	)
Product.create(
	category_id: Category.find_by_name("Наборы").id,
	company_id: Company.first.id,
	title: 'Mix сет',
	brief: 'В состав сета входят 2 больших бургера: Чикен / Классик, Куриные крылышки 2 порции M на выбор, Картофель дольками, Соус на выбор',
	description: "В состав сета входят 2 больших бургера: \nЧикен \n/ Классик, Куриные крылышки 2 порции M: Баффало / Кентукки / Медово-горчичные / Бурбон-барбекю, \nКартофель дольками (2 порции), \nСоус на выбор (2 порции)",
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/set3-min.png',
	main_options: [{ name: 'Mix сет', cost: 1470 }],
	)
Product.create(
	category_id: Category.find_by_name("Наборы").id,
	company_id: Company.first.id,
	title: 'Beer сет',
	brief: 'Самый большой ChiXX сет: Куриные крылышки на выбор, Картофель дольками, Луковые кольца, Соус на выбор',
	description: "Самый большой ChiXX сет: \nКуриные крылышки на выбор (3 XL порции) \n+ Картофель дольками / Луковые кольца (3 порции) \n+ Соус на выбор (3 порции) \nЭтот сет можно дополнить Бургерами Бульдог \nсо скидкой 10%",
	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/set4-min.png',
	main_options: [{ name: 'Beer сет', cost: 1810 }],
	)
