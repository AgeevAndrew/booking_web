ActiveRecord::Base.transaction do
  categories = []

  categories << Category.find_or_create_by(name: 'Бургеры', icon_type: 'icon_burger', description: '').id
  categories << Category.find_or_create_by(name: 'Крылышки', icon_type: 'icon_wing', description: '').id
  categories << Category.find_or_create_by(name: 'Горячее', icon_type: 'icon_chips', description: '').id
  categories << Category.find_or_create_by(name: 'Салаты', icon_type: 'icon_salat', description: '').id
  categories << Category.find_or_create_by(name: 'Сеты', icon_type: 'icon_set', description: '').id
  # categories << Category.find_or_create_by(name: 'Напитки', icon_type: 'icon_drinks', description: '').id
  # categories << Category.find_or_create_by(name: 'Десерты', icon_type: 'icon_set', description: '').id
  # categories << Category.find_or_create_by(name: 'Супы', icon_type: 'icon_soup', description: '').id
  # categories << Category.find_or_create_by(name: 'Соусы', icon_type: 'icon_sauce', description: '').id

  company_addresses = []

  company_addresses << Address.create(
                          title: 'Burgx',
                          city: 'Хабаровск',
                          street: 'ул. Ленинградская',
                          house: '28Г3').id

  company = Company.find_or_initialize_by(name: 'Burgx')

  company.update(categories: categories,
  							 description: "В Burgx вас всегда ждет уютная, гостеприимная атмосфера. это сочные и сильные бургеры только из 100% натуральной мраморной говядины. \nБургерная Burgx - это натуральные и качественные бургеры по демократичным ценам, для широкой аудитории!",
  							 delivery: { cost: 150, free_shipping: 800, pickup_discount: 10, period: { start: '12:00 +10', end: '19:30 +10' } },
  							 contact_info: { phone: '+7 (4212) 699-207', email: 'info@noxfox.ru', geotag: ["48.483257,135.094393"], geotag_cafe: ["48.483257,135.094393"] },
                 address_ids: company_addresses)

  company_id = company.id

  CompanySchedule.where(company_id: company_id).delete_all
  Product.where(company_id: company_id).delete_all

  CompanySchedule.create(
    company_id: company_id,
  	week_day: 'sun',
  	time_start: '11:00:00+10',
  	time_end: '22:00:00+10'
  )
  CompanySchedule.create(
    company_id: company_id,
  	week_day: 'mon',
  	time_start: '11:00:00+10',
  	time_end: '22:00:00+10'
  )
  CompanySchedule.create(
    company_id: company_id,
  	week_day: 'tue',
  	time_start: '11:00:00+10',
  	time_end: '22:00:00+10'
  )
  CompanySchedule.create(
    company_id: company_id,
  	week_day: 'wed',
  	time_start: '11:00:00+10',
  	time_end: '22:00:00+10'
  )
  CompanySchedule.create(
    company_id: company_id,
  	week_day: 'thu',
  	time_start: '11:00:00+10',
  	time_end: '22:00:00+10'
  )
  CompanySchedule.create(
    company_id: company_id,
  	week_day: 'fri',
  	time_start: '11:00:00+10',
  	time_end: '00:00:00+10'
  )
  CompanySchedule.create(
    company_id: company_id,
  	week_day: 'sat',
  	time_start: '12:00:00+10',
  	time_end: '00:00:00+10'
  							 )

  # Пицца
  Product.create(
  	category_id: Category.find_by_name("Бургеры").id,
  	company_id: company_id,
  	title: 'Двойной удар',
  	brief: 'Сокрушительный удар по голоду! Невообразимо аппетитный бургер, в котором с успехом сочетается бекон и две говяжьих котлеты с плавленым сыром',
  	description: 'Две сочные котлеты из мраморной говядины, восхитительный хрустящий бекон, двойной сыр, салатные листья, свежие томаты, огурец, красный лук, но самое главное - великолепный соус гриль и наш фирменный карамелизированный соус с ворчестером. Комплимент – салатик Коул Слоу.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-1.png',
  	main_options: [{ name: '400 гр', cost: 485 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Бургеры").id,
  	company_id: company_id,
  	title: 'Инфернальный',
  	brief: 'Самый острый бургер в нашей коллекции! Особую пикантность придают сыр с благородной голубой плесенью в сочетании с перчиком Халапеньо',
  	description: 'Листья салата, соус Баффало, куриная котлета, сыр Чеддер, свежий помидор, перчик Халапеньо, салат Коул Слоу, голубой сыр, соус Табаско. Комплимент – салатик Коул Слоу.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-2.png',
  	main_options: [{ name: '300 гр', cost: 330 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Бургеры").id,
  	company_id: company_id,
  	title: 'Властелин колец',
  	brief: 'Моя прелесть! Золотые кольца лука не оставят Вас равнодушным к этому бургеру.',
  	description: 'Золотые кольца лука, лук-фри, говяжья котлета, сыр Чеддер, свежие помидоры, красный лук, салатные листья, нежный майонез и соус Сальса в кунжутной булочке. Комплимент – салатик Коул Слоу.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-3.png',
  	main_options: [{ name: '280 гр', cost: 270 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Бургеры").id,
  	company_id: company_id,
  	title: 'Феталити',
  	brief: 'Встречайте бургер нового поколения - героя второго сезона Burxg. Без кетчупа и майонеза.',
  	description: 'Булочка, сливочно-мятный соус, свежий томат, куриная котлета, сок лимона, сыр фета. Комплимент – салатик Коул Слоу.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-4.png',
  	main_options: [{ name: '270 гр', cost: 330 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Бургеры").id,
  	company_id: company_id,
  	title: 'Чикенчиз',
  	brief: 'Известная интерпретация чизбургера с маринованными огурчиками и куриной котлетой.',
  	description: 'Сочная куриная котлета, маринованные огурцы, листы салата, ломтик вкуснейшего сыра, свежие помидоры. Комплимент – салатик Коул Слоу.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-5.png',
  	main_options: [{ name: '330 гр', cost: 225 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Бургеры").id,
  	company_id: company_id,
  	title: 'Цезарь жив!',
  	brief: 'Рецепт бургера приближен к традиционному салату «Цезарь» с котлетой из курочки под нежным соусом Цезарь.',
  	description: 'Аппетитный бургер с пышной булочкой, сочный куриной котлетой, нежным сыром, свежим помидором, салатом и соусом Цезарь. Комплимент – салатик Коул Слоу.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-6.png',
  	main_options: [{ name: '488 гр', cost: 510 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Бургеры").id,
  	company_id: company_id,
  	title: 'Фалафель-бургер',
  	brief: 'Бургер — это не всегда мясо. Веганский рецепт бургера — самый полезный и здоровый вариант!',
  	description: 'Салатный лист, котлета из фалафеля, цуккини-гриль, баклажан-гриль, перец-гриль, соус 1000 островов. Комплимент – салатик Коул Слоу.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-7.png',
  	main_options: [{ name: '300 гр', cost: 275 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Бургеры").id,
  	company_id: company_id,
  	title: 'Неряха Джо',
  	brief: 'Чудо карательной кулинарии под названием "Неряха Джо". В нашей версии все брутально и просто – огромная котлета с булкой без излишеств',
  	description: 'Булочка, листья салата, сыр Чеддер, соус Сальса, красный лук, увеличенная котлета. Комплимент – салатик Коул Слоу.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-8.png',
  	main_options: [{ name: '400 гр', cost: 570 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Крылышки").id,
  	company_id: company_id,
  	title: 'Буффало',
  	brief: 'Одно из самых культовых блюд американской кухни! Нежные, сочные обжаренные и покрытые специальным соусом.',
  	description: 'Одно из самых культовых блюд американской кухни! Нежные, сочные обжаренные и покрытые специальным соусом. Изобретение Терезы Беллисимо, владелицы бара Якорь в городке Буффало, штат Нью-йорк, стало поистине классикой американской кухни. Классический вариант подачи с соусом на основе голубого сыра считается каноном во всем мире.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-9.png',
  	main_options: [{ name: '8 шт - 340 гр', cost: 340 },{ name: '14 шт - 600 гр', cost: 510 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Крылышки").id,
  	company_id: company_id,
  	title: 'Терияки',
  	brief: 'Вкус настоящей Азии! С кунжутом в оригинальном соусе Терияки, вкусные и очень ароматные.',
  	description: 'Вкус настоящей Азии! С кунжутом, покрытые оригинальном соусом Терияки, крылышки получаются очень вкусными и ароматными.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-9.png',
  	main_options: [{ name: '8 шт - 340 гр', cost: 340 },{ name: '14 шт - 600 гр', cost: 510 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Крылышки").id,
  	company_id: company_id,
  	title: 'Горчица и мед',
  	brief: 'Мягкие и сочные слабоострые крылышки в медово-горчичном соусе.',
  	description: 'Мягкие и сочные слабоострые крылышки в медово-горчичном соусе. Особую пикантность и нежность придает сочетание горчицы и меда в соусе.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-9.png',
  	main_options: [{ name: '8 шт - 340 гр', cost: 340 },{ name: '14 шт - 600 гр', cost: 510 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Крылышки").id,
  	company_id: company_id,
  	title: 'Американо',
  	brief: 'Оригинальные американские куриные крылышки, захватившие мир.',
  	description: 'Оригинальные американские куриные крылышки, захватившие мир. Вы наверняка с ходу сможете назвать десяток американских фильмом, в которых герои с нескрываемым удовольствием поглощали бы крылышки. А кто мешает вам попробовать такое необычное для нас блюдо?',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-9.png',
  	main_options: [{ name: '8 шт - 340 гр', cost: 340 },{ name: '14 шт - 600 гр', cost: 510 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Крылышки").id,
  	company_id: company_id,
  	title: 'BBQ',
  	brief: 'С ароматом дымка и соуса BBQ.',
  	description: 'С ароматом дымка и соуса BBQ. Ароматные, аппетитные, вкусные крылышки. Они могут быть, как самостоятельным блюдом, так и отличной закуской к пиву.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-9.png',
  	main_options: [{ name: '8 шт - 340 гр', cost: 340 },{ name: '14 шт - 600 гр', cost: 510 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Крылышки").id,
  	company_id: company_id,
  	title: 'Пармезан',
  	brief: 'Любите ли вы сыр, также как его любым мы? Тогда эти крылышки для вас! Встречайте в новом сезоне.',
  	description: 'Любите ли вы сыр, также как его любым мы? Тогда эти крылышки для вас! Встречайте в новом сезоне. Нежное мясо с сыром никого не оставит равнодушным.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-9.png',
  	main_options: [{ name: '8 шт - 340 гр', cost: 340 },{ name: '14 шт - 600 гр', cost: 510 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Крылышки").id,
  	company_id: company_id,
  	title: 'Спайси',
  	brief: 'Остренькие в соусе Шрирача с чесночным вкусом.',
  	description: 'Остренькие в соусе Шрирача с чесночным вкусом. Огненно-острый вкус тщательно промаринованных крылышек порадует любителей блюд "погорячее"! Пикантный соус на основе перца чили и чеснока никого не оставит равнодушным!',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-9.png',
  	main_options: [{ name: '8 шт - 340 гр', cost: 340 },{ name: '14 шт - 600 гр', cost: 510 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Салаты").id,
  	company_id: company_id,
  	title: 'Цезарь с курицей”',
  	brief: 'Листья салата, хрустящие кусочки куриного филе, сухарики, твердый сыр и заправка Цезарь.',
  	description: 'Листья салата, хрустящие кусочки куриного филе, сухарики, твердый сыр и заправка Цезарь.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-10.png',
  	main_options: [{ name: '230 гр', cost: 245 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Салаты").id,
  	company_id: company_id,
  	title: 'Цезарь с беконом',
  	brief: 'Листья салата, хрустящие кусочки бекона на гриле, сухарики, твердый сыр и заправка Цезарь.',
  	description: 'Листья салата, хрустящие кусочки бекона на гриле, сухарики, твердый сыр и заправка Цезарь.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-11.png',
  	main_options: [{ name: '230 гр', cost: 245 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Салаты").id,
  	company_id: company_id,
  	title: 'Греческий',
  	brief: 'Салатные листья, болгарский перец, свежие помидоры и огурцы, сыр Фета, красный лук, маслины и фирменная заправка',
  	description: 'Салатные листья, болгарский перец, свежие помидоры и огурцы, сыр Фета, красный лук, маслины и фирменная заправка.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-12.png',
  	main_options: [{ name: '230 гр', cost: 200 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Салаты").id,
  	company_id: company_id,
  	title: 'Коул Слоу',
  	brief: 'Классический американский овощной салат из яблока, капусты и моркови. Считается классическим дополнением к бургерам в американской кухне.',
  	description: 'Классический американский овощной салат из яблока, капусты и моркови. Считается классическим дополнением к бургерам в американской кухне.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-12.png',
  	main_options: [{ name: '150 гр', cost: 90 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Сеты").id,
  	company_id: company_id,
  	title: 'Сет №1',
  	brief: 'Классический бургер с говяжьей котлетой, салат Коул Слоу, картошка фри с кетчупом, бутылочка напитка на выбор.',
  	description: 'Классический бургер с говяжьей котлетой, салат Коул Слоу, картошка фри с кетчупом, бутылочка напитка на выбор',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-12.png',
  	main_options: [{ name: '180 гр. /100 гр. /120 гр. /150 гр. /600 мл', cost: 330 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Сеты").id,
  	company_id: company_id,
  	title: 'Сет №2. ',
  	brief: 'Классический бургер с куриной котлетой, салат Коул Слоу, картошка фри с кетчупом, бутылочка напитка на выбор.',
  	description: 'Классический бургер с говяжьей котлетой, салат Коул Слоу, картошка фри с кетчупом, бутылочка напитка на выбор',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-12.png',
  	main_options: [{ name: '200 гр. /100 гр. /120 гр. /150 гр. /600 мл', cost: 330 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Сеты").id,
  	company_id: company_id,
  	title: 'Сет №3. Пивная тарелка',
  	brief: 'Ассорти из обжаренных вкусняшек к пиву - картофель фри, свежеобжаренные чипсы, луковые кольца (10 шт.), сырные палочки (5 шт.) + 2 соуса.',
  	description: 'Ассорти из обжаренных вкусняшек к пиву - картофель фри, свежеобжаренные чипсы, луковые кольца (10 шт.), сырные палочки (5 шт.) + 2 соуса.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-12.png',
  	main_options: [{ name: '120 гр./ 50 гр. / 130 гр. / 5 шт. / 50 + 50 мл.', cost: 330 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Сеты").id,
  	company_id: company_id,
  	title: 'Сет №4. Крылышки 20.',
  	brief: 'А можно все попробовать? Можно! Ассорти из куриных крылышек – по 4 кусочка крыльев Американо, Спайси, Терияки, Пармезан и Медово-горчичные.',
  	description: 'А можно все попробовать? Можно! Ассорти из куриных крылышек – по 4 кусочка крыльев Американо, Спайси, Терияки, Пармезан и Медово-горчичные.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-12.png',
  	main_options: [{ name: '180 гр. /100 гр. /120 гр. /150 гр. /600 мл', cost: 330 }],
  )

  Product.create(
  	category_id: Category.find_by_name("Горячее").id,
  	company_id: company_id,
  	title: 'Овощи-гриль',
  	brief: 'Обжаренные на гриле цуккини, баклажаны, сладкий перец и грибочки.',
  	description: 'Обжаренные на гриле цуккини, баклажаны, сладкий перец и грибочки.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-12.png',
  	main_options: [{ name: '190 гр.', cost: 135 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Горячее").id,
  	company_id: company_id,
  	title: 'Пельмени Гедза с говядиной',
  	brief: 'Обжаренные до хрустящей корочки японские пельмешки с говядиной',
  	description: 'Гёдза – очень популярное блюдо в Японии. Изначально так называли китайские жареные пельмени цзяоцзы, но блюдо так полюбилось японцам, что они начали его считать своим и использовать для приготовления гёдза разнообразные ингредиенты. В настоящее время классика уличного стрит-фуда в городах Юго-Восточной Азии',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-12.png',
  	main_options: [{ name: '12 шт.', cost: 245 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Горячее").id,
  	company_id: company_id,
  	title: 'Картошка фри',
  	brief: 'Хрустящая классика жанра американской кухни!',
  	description: 'a.	Хрустящая классика жанра американской кухни!',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-12.png',
  	main_options: [{ name: '120 гр.', cost: 105 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Горячее").id,
  	company_id: company_id,
  	title: 'Картофельные дольки',
  	brief: 'Золотистая картошечка дольками по-деревенски.',
  	description: 'Золотистая картошечка дольками по-деревенски.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-12.png',
  	main_options: [{ name: '130 гр.', cost: 120 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Горячее").id,
  	company_id: company_id,
  	title: 'Жареная картошка с грибами и луком',
  	brief: 'Такая же вкусная жареная картошка, обогащенная вкусом жареных шампиньонов',
  	description: 'Золотистая картошечка жареная с луком и грибами-шампиньонами',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-12.png',
  	main_options: [{ name: '170 гр.', cost: 155 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Горячее").id,
  	company_id: company_id,
  	title: 'Чипсы',
  	brief: 'Хрустящая классическая закуска свежей обжарки',
  	description: 'Хрустящая классическая закуска свежей обжарки идеальна к пивку!',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-12.png',
  	main_options: [{ name: '50 гр.', cost: 70 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Горячее").id,
  	company_id: company_id,
  	title: 'Луковые кольца',
  	brief: 'Луковые кольца – это популярная закуска к основному блюду из рыбы, мяса или овощей.',
  	description: 'Из истории кулинарии известно, что это блюдо родилось в южных штатах США около 100 лет назад. Рекомендуем попробовать золотистые вкусняшки с кетчупом!',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-12.png',
  	main_options: [{ name: '130 гр. (примерно 10 шт.)', cost: 120 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Горячее").id,
  	company_id: company_id,
  	title: 'Сырные палочки',
  	brief: 'Сырные палочки – замечательная закуска к кружечке холодного темного или светлого пива, которая замечательно утоляет голод',
  	description: 'Сырные палочки – замечательная закуска к кружечке холодного темного или светлого пива, которая замечательно утоляет голод',
  	photo: 'https://195319.selcdn.ru/delivery_food/Crossroad/products/pizza-12.png',
  	main_options: [{ name: '5 шт.', cost: 170 }],
  )
end
