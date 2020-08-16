﻿#language: ru

@tree

Функциональность: Показатель с отложенным расчетом

Я хочу убедиться в работспособности показателей с отложенным расчетом

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
		
Сценарий: Тестирование показателя с отложенным расчетом
	Дано Я создаю показатель "Тест Отложенный расчет"
		И Я открываю навигационную ссылку "e1cib/list/ПланВидовХарактеристик.ПоказателиОбъектов"
		И Я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Показатели объектов (создание)'
		И в поле 'Наименование' я ввожу текст "Тест Отложенный расчет"
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
			|'ВЫБРАТЬ'							|
			|'	ВТ_Объекты.Объект КАК Объект,'	|
			|'	123 КАК ЗначениеПоказателя'		|
			|'ИЗ'								|
			|'	ВТ_Объекты КАК ВТ_Объекты'		|

		И я перехожу к закладке "Запуск расчета (что является инициатором запуска расчета)"
		И я устанавливаю флаг 'Запускать по триггерам'
		И в таблице "Триггеры" я нажимаю на кнопку с именем 'ТриггерыДобавить'
		И в таблице "Триггеры" я нажимаю кнопку выбора у реквизита "Объект метаданных"
		Тогда открылось окно 'Объекты метаданных ПО'
		И в таблице "Список" я перехожу к строке:
			| 'Представление' |
			| 'Справочники'   |
		И в таблице "Список" я выбираю текущую строку
		И в таблице "Список" я перехожу к строке:
			| 'Представление'					|
			| 'Демо номенклатура (Справочник)'	|
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Показатели объектов (создание) *'
		И в таблице "Триггеры" я активизирую поле "Ключ"
		И в таблице "Триггеры" я нажимаю кнопку выбора у реквизита "Ключ"
		Тогда открылось окно 'Свойства объектов метаданных ПО'
		И в таблице "Список" я перехожу к строке:
			| 'Имя'		|
			| 'Ссылка'	|
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Показатели объектов (создание) *'
		И в таблице "Триггеры" я устанавливаю флаг 'Отложенный расчет'
		И в таблице "Триггеры" я завершаю редактирование строки
		И я нажимаю на кнопку 'Записать и закрыть'
		И я жду закрытия окна 'Показатели объектов (создание) *' в течение 2 секунд
		
	И я создаю номенклатуру с наименованием "Тест Товар"
		Когда В командном интерфейсе я выбираю 'Демо' 'Демо номенклатура'
		Тогда открылось окно 'Демо номенклатура'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Демо номенклатура (создание)'
		И в поле 'Наименование' я ввожу текст 'Тест Товар'
		И я нажимаю на кнопку 'Записать'
		И Пауза 5
		И в текущем окне я нажимаю кнопку командного интерфейса 'Значения показателей объектов'
		И Я устанавливаю фильтр на список
			| Показатель | Равно | 'Тест Отложенный расчет' |
		И таблица "Список" стала равной:
					| 'Объект'		| 'Показатель'				| 'Значение показателя'	|
					| 'Тест Товар'	| 'Тест Отложенный расчет'	| 123					| 
		И я закрываю текущее окно
		И я закрываю текущее окно
		
	И Я удаляю показатель 
		И Я открываю навигационную ссылку "e1cib/list/ПланВидовХарактеристик.ПоказателиОбъектов"
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'Тест Отложенный расчет' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Тест Отложенный расчет (Показатели объектов)'
		И в поле 'Наименование' я ввожу текст 'Удалить Тест Отложенный расчет'
		И я перехожу к следующему реквизиту
		И я нажимаю на кнопку 'Пометить на удаление / Снять пометку'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Да'
		И Я закрываю текущее окно
		И Я удаляю показатель с кодом "УдалитьТестОтложенныйРасчет"
		И Я закрываю текущее окно
	
	И я удаляю номенклатуру с наименованием "Тест Товар"