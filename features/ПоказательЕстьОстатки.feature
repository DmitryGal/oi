﻿#language: ru

@tree

Функциональность: Показатель "Есть остатки"

Я хочу создать показатель, который указывал бы на наличие остаков по номенклатуре (РН ДемоОстаткиТоваров)

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я задаю таблицу строк "ИсходныеДанные"
		| 'Товар'			| 'Приход'	| 'Расход'	| 'Остаток'	| 'ЕстьОстаток'	|
		| 'Тест Товар 01'	| 10		| 20		| -10		| 'Нет'			|
		| 'Тест Товар 02'	| 100		| 100		| 0			| 'Нет'			|
		| 'Тест Товар 03'	| 10		| 4			| 6			| 'Да'			|
		| 'Тест Товар 04'	| 20		| 0			| 20		| 'Да'			|
		| 'Тест Товар 05'	| 0			| 0			| 0			| 'Нет'			|
		| 'Тест Товар 06'	| 0			| 20		| -20		| 'Нет'			|
		| 'Тест Товар 07'	| 10		| 0			| 10		| 'Да'			|
		| 'Тест Товар 08'	| 10		| 0			| 10		| 'Да'			|
		| 'Тест Товар 09'	| 10		| 0			| 10		| 'Да'			|
		| 'Тест Товар 10'	| 10		| 0			| 10		| 'Да'			|
		
Сценарий: Тестирование показателя "Тест Есть остатки"
	Дано Я создаю показатель "Тест Есть остатки"
		И Я открываю навигационную ссылку "e1cib/list/ПланВидовХарактеристик.ПоказателиОбъектов"
		И Я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Показатели объектов (создание)'
		И в поле 'Наименование' я ввожу текст "Тест Есть остатки"
		И я нажимаю кнопку выбора у поля с именем "Владелец"
		Тогда открылось окно 'Объекты метаданных ПО'
		И в таблице "Список" я перехожу к строке:
			| 'Представление' |
			| 'Справочники'   |
		И в таблице "Список" я выбираю текущую строку
		И в таблице "Список" я перехожу к строке:
			| 'Представление'                |
			| 'Демо номенклатура (Справочник)' |
		И в таблице "Список" я выбираю текущую строку
		И я меняю значение переключателя 'Способ расчета' на 'Запрос'
		И я перехожу к закладке "Страница запрос"
		И в поле 'ТекстЗапроса' я ввожу текст 
			|' ВЫБРАТЬ РАЗРЕШЕННЫЕ										'|
			|'	ОстаткиТоваровОстатки.Товар КАК Товар,					'|
			|'	ОстаткиТоваровОстатки.КоличествоОстаток КАК Количество	'|
			|'ПОМЕСТИТЬ ВТ_Остатки										'|
			|'ИЗ														'|
			|'	РегистрНакопления.ДемоОстаткиТоваров.Остатки(			'|
			|'			,												'|
			|'			Товар В											'|
			|'				(ВЫБРАТЬ									'|
			|'					ВТ_Объекты.Объект						'|
			|'				ИЗ											'|
			|'					ВТ_Объекты)) КАК ОстаткиТоваровОстатки	'|
			|'ГДЕ														'|
			|'	ОстаткиТоваровОстатки.КоличествоОстаток > 0				'|
			|';															'|
			|'															'|
			|'////////////////////////////////////////////////////////	'|
			|'ВЫБРАТЬ													'|
			|'	ВТ_Объекты.Объект КАК Объект,							'|
			|'	НЕ ВТ_Остатки.Товар ЕСТЬ NULL КАК ЗначениеПоказателя	'|
			|'ИЗ														'|
			|'	ВТ_Объекты КАК ВТ_Объекты								'|
			|'		ЛЕВОЕ СОЕДИНЕНИЕ ВТ_Остатки КАК ВТ_Остатки			'|
			|'		ПО ВТ_Объекты.Объект = ВТ_Остатки.Товар				'|

		И я перехожу к закладке "Запуск расчета (что является инициатором запуска расчета)"
		И я устанавливаю флаг 'Запускать по триггерам'
		И в таблице "Триггеры" я нажимаю на кнопку с именем 'ТриггерыДобавить'
		И в таблице "Триггеры" я нажимаю кнопку выбора у реквизита "Объект метаданных"
		Тогда открылось окно 'Объекты метаданных ПО'
		И в таблице "Список" я перехожу к строке:
			| 'Представление' |
			| 'Регистры накопления'   |
		И в таблице "Список" я выбираю текущую строку
		И в таблице "Список" я перехожу к строке:
			| 'Представление'                                  |
			| 'Демо остатки товаров (Регистр накопления)' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Показатели объектов (создание) *'
		И в таблице "Триггеры" я активизирую поле "Ключ"
		И в таблице "Триггеры" я нажимаю кнопку выбора у реквизита "Ключ"
		Тогда открылось окно 'Свойства объектов метаданных ПО'
		И в таблице "Список" я перехожу к строке:
			| 'Имя' |
			| 'Товар' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Показатели объектов (создание) *'
		И в таблице "Триггеры" я завершаю редактирование строки
	
		И я нажимаю на кнопку 'Записать и закрыть'
		И я жду закрытия окна 'Показатели объектов (создание) *' в течение 2 секунд
		
	И я создаю коллекцию номенклатуры
		И для каждого значения "СтрокаТаблицы" из таблицы в памяти "ИсходныеДанные"
			И Я создаю позицию номенклатуры
				Когда я открываю основную форму справочника "ДемоНоменклатура"
				Тогда Открылось окно "Демо номенклатура (Создание)"
				И в поле "Наименование" я ввожу текст "$Товар$"
				И я нажимаю на кнопку "Записать и закрыть"
				И я жду закрытия окна "Демо номенклатура (Создание)" в течение 2 секунд
		И я закрываю текущее окно
	
	И я создаю приходную накладную
		Когда я открываю основную форму документа "ДемоПриходнаяНакладная"
		Тогда Открылось окно "Демо приходная накладная (Создание)"
		И в поле "Комментарий" я ввожу текст "Автотест"
		И для каждого значения "СтрокаТаблицы" из таблицы в памяти "ИсходныеДанные"
			И в таблице "Товары" я нажимаю на кнопку "Добавить"
			И в таблице "Товары" я нажимаю кнопку выбора у реквизита "Товар"
			Тогда открылось окно "Демо номенклатура"
			И в таблице "Список" я перехожу к строке
				| 'Наименование'	|
				| '$Товар$'			|
			И я нажимаю на кнопку "Выбрать"
			И я жду закрытия окна "Демо номенклатура" в течение 1 секунд
			Тогда Открылось окно "Демо приходная накладная (Создание)*"
			И в таблице "Товары" в поле "Количество" я ввожу текст "$Приход$"
		И я нажимаю на кнопку "Провести и закрыть"
		И я жду закрытия окна "Демо приходная накладная (Создание)*" в течение 2 секунд
		
	И я создаю расходную накладную
		Когда я открываю основную форму документа "ДемоРасходнаяНакладная"
		Тогда Открылось окно "Демо расходная накладная (Создание)"
		И в поле "Комментарий" я ввожу текст "Автотест"
		И для каждого значения "СтрокаТаблицы" из таблицы в памяти "ИсходныеДанные"
			И в таблице "Товары" я нажимаю на кнопку "Добавить"
			И в таблице "Товары" я нажимаю кнопку выбора у реквизита "Товар"
			Тогда открылось окно "Демо номенклатура"
			И в таблице "Список" я перехожу к строке
				| 'Наименование'	|
				| '$Товар$'			|
			И я нажимаю на кнопку "Выбрать"
			И я жду закрытия окна "Демо номенклатура" в течение 1 секунд
			Тогда Открылось окно "Демо расходная накладная (Создание)*"
			И в таблице "Товары" в поле "Количество" я ввожу текст "$Расход$"
		И я нажимаю на кнопку "Провести и закрыть"
		И я жду закрытия окна "Демо расходная накладная (Создание)*" в течение 2 секунд
	
	И я проверяю значения показателя для коллекции номенклатуры
		И я открываю основную форму списка справочника "ДемоНоменклатура"
		И для каждого значения "СтрокаТаблицы" из таблицы в памяти "ИсходныеДанные"
			Тогда открылось окно "Демо номенклатура"
			И в таблице "Список" я перехожу к строке
				|'Наименование'|
				|'$Товар$'|
			И в таблице "Список" я выбираю текущую строку
			И в текущем окне я нажимаю кнопку командного интерфейса 'Значения показателей объектов'
			И Я устанавливаю фильтр на список
			| Показатель | Равно | Тест Есть остатки |		
			
			И таблица "Список" стала равной:
					| 'Объект'	| 'Показатель'			| 'Значение показателя'	|
					| $Товар$	| 'Тест Есть остатки'	| '$ЕстьОстаток$'	| 
			И я закрываю текущее окно
		И я закрываю текущее окно

	И Я удаляю показатель 
		И Я открываю навигационную ссылку "e1cib/list/ПланВидовХарактеристик.ПоказателиОбъектов"
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'Тест Есть остатки' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Тест Есть остатки (Показатели объектов)'
		И в поле 'Наименование' я ввожу текст 'Удалить Тест Есть остатки'
		И я перехожу к следующему реквизиту
		И я нажимаю на кнопку 'Пометить на удаление / Снять пометку'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Да'
		И Я закрываю текущее окно
		И Я удаляю показатель с кодом "УдалитьТестЕстьОстатки"
		И Я закрываю текущее окно
	
	И я удаляю документы
		И я удаляю расходные накладные
			Когда я открываю основную форму списка документа "ДемоРасходнаяНакладная"
			Тогда открылось окно "Демо расходная накладная"
			И в таблице "Список" я активизирую поле "Дата"
			И я нажимаю на кнопку с именем 'ФормаУстановитьИнтервал'
			Тогда открылось окно 'Выберите период'
			И я нажимаю на гиперссылку "SwitchText"
			И я перехожу к закладке "Group standard period"
			И я нажимаю на кнопку 'День'
			И в таблице "PeriodVariantTable" я перехожу к строке:
				| 'Значение' |
				| 'Сегодня'  |
			И я нажимаю на кнопку 'Выбрать'
			Тогда открылось окно "Демо расходная накладная"
			И для каждой строки таблицы "Список" я выполняю в обратном порядке
				Если в таблице "Список" поле "Комментарий" имеет значение "Автотест" тогда
					Тогда я удаляю текущую расходную накладную
			И я закрываю текущее окно
			
		И я удаляю приходные накладные
			Когда я открываю основную форму списка документа "ДемоПриходнаяНакладная"
			Тогда открылось окно "Демо приходная накладная"
			И в таблице "Список" я активизирую поле "Дата"
			И я нажимаю на кнопку с именем 'ФормаУстановитьИнтервал'
			Тогда открылось окно 'Выберите период'
			И я нажимаю на гиперссылку "SwitchText"
			И я перехожу к закладке "Group standard period"
			И я нажимаю на кнопку 'День'
			И в таблице "PeriodVariantTable" я перехожу к строке:
				| 'Значение' |
				| 'Сегодня'  |
			И я нажимаю на кнопку 'Выбрать'
			Тогда открылось окно "Демо приходная накладная"
			И для каждой строки таблицы "Список" я выполняю в обратном порядке
				Если в таблице "Список" поле "Комментарий" имеет значение "Автотест" тогда
					Тогда я удаляю текущую приходную накладную
			И я закрываю текущее окно
			
	И я удаляю коллекцию номенклатуры
		И для каждого значения "СтрокаТаблицы" из таблицы в памяти "ИсходныеДанные"
			И я удаляю номенклатуру с наименованием "$Товар$"