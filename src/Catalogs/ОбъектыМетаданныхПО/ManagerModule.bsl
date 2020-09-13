#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область СлужебныйПрограммныйИнтерфейс

Процедура ОбновитьДанныеСправочника() Экспорт
	
	КоллекцияМетаданных = НовыйКоллекцияМетаданных();
	ЗаполнитьПредопределенныеОбъектыМетаданных(КоллекцияМетаданных);
	
	Для Каждого ОбъектМетаданных Из ОбъектыСПоказателями() Цикл
		ЗарегистрироватьОбъектМетаданныхВКоллекции(КоллекцияМетаданных, ОбъектМетаданных, Истина);
	КонецЦикла;
	
	Для Каждого ОбъектМетаданных Из ТриггерыРасчетаПоказателей() Цикл
		ЗарегистрироватьОбъектМетаданныхВКоллекции(КоллекцияМетаданных, ОбъектМетаданных, , Истина);
	КонецЦикла;
	
	ЗаписатьКоллекциюМетаданныхВСправочник(КоллекцияМетаданных);
	
КонецПроцедуры

#КонецОбласти
	
#Область СлужебныеПроцедурыИФункции

Функция НовыйКоллекцияМетаданных()
	
	ОписаниеТиповУникальныйИдентификатор = Новый ОписаниеТипов("УникальныйИдентификатор");
	ОписаниеТиповСтрока_150 = Новый ОписаниеТипов("Строка", , Новый КвалификаторыСтроки(150));
	ОписаниеТиповСтрока_255 = Новый ОписаниеТипов("Строка", , Новый КвалификаторыСтроки(255));
	ОписаниеТиповСтрока_430 = Новый ОписаниеТипов("Строка", , Новый КвалификаторыСтроки(430));
	ОписаниеТиповБулево		= Новый ОписаниеТипов("Булево");
	
	КоллекцияМетаданных = Новый ТаблицаЗначений;
	
	КоллекцияМетаданных.Колонки.Добавить("УникальныйИдентификатор", ОписаниеТиповУникальныйИдентификатор);
	КоллекцияМетаданных.Колонки.Добавить("Имя",						ОписаниеТиповСтрока_255);
	КоллекцияМетаданных.Колонки.Добавить("Синоним",					ОписаниеТиповСтрока_255);
	КоллекцияМетаданных.Колонки.Добавить("ПолноеИмя",				ОписаниеТиповСтрока_430);
	КоллекцияМетаданных.Колонки.Добавить("Представление",			ОписаниеТиповСтрока_150);
	КоллекцияМетаданных.Колонки.Добавить("Родитель",				ОписаниеТиповУникальныйИдентификатор);
	КоллекцияМетаданных.Колонки.Добавить("ЭтоГруппа",				ОписаниеТиповБулево);
	КоллекцияМетаданных.Колонки.Добавить("МожетИметьПоказатели",	ОписаниеТиповБулево);
	КоллекцияМетаданных.Колонки.Добавить("ЯвляетсяТриггером",		ОписаниеТиповБулево);
	
	Возврат КоллекцияМетаданных;
	
КонецФункции

Процедура ЗаполнитьПредопределенныеОбъектыМетаданных(КоллекцияМетаданных)
	
	// Добавляем типы метаданных
	
	// Справочники
	НоваяСтрока = КоллекцияМетаданных.Добавить();
	НоваяСтрока.УникальныйИдентификатор	= Новый УникальныйИдентификатор("3b3d562b-2c5b-4ebe-9687-6c91118eba0b");
	НоваяСтрока.Имя 					= "Справочники";
	НоваяСтрока.ПолноеИмя				= "Справочник";
	НоваяСтрока.Синоним					= "Справочники";
	НоваяСтрока.Представление			= "Справочники";
	НоваяСтрока.ЭтоГруппа				= Истина;
	
	// Документы
	НоваяСтрока = КоллекцияМетаданных.Добавить();
	НоваяСтрока.УникальныйИдентификатор	= Новый УникальныйИдентификатор("57ca0fd8-4e12-4477-b8d8-d1105522c3bd");
	НоваяСтрока.Имя 					= "Документы";
	НоваяСтрока.ПолноеИмя				= "Документ";
	НоваяСтрока.Синоним					= "Документы";
	НоваяСтрока.Представление			= "Документы";
	НоваяСтрока.ЭтоГруппа				= Истина;
	
	// Регистры сведений
	НоваяСтрока = КоллекцияМетаданных.Добавить();
	НоваяСтрока.УникальныйИдентификатор	= Новый УникальныйИдентификатор("18dccdb0-8b40-420d-8b3b-d28cd659f168");
	НоваяСтрока.Имя 					= "РегистрыСведений";
	НоваяСтрока.ПолноеИмя				= "РегистрСведений";
	НоваяСтрока.Синоним					= "Регистры сведений";
	НоваяСтрока.Представление			= "Регистры сведений";
	НоваяСтрока.ЭтоГруппа				= Истина;
	
	// Регистры накопления
	НоваяСтрока = КоллекцияМетаданных.Добавить();
	НоваяСтрока.УникальныйИдентификатор	= Новый УникальныйИдентификатор("a0ee5599-2ca0-489e-a0ef-a51a2b2d37dc");
	НоваяСтрока.Имя 					= "РегистрыНакопления";
	НоваяСтрока.ПолноеИмя				= "РегистрНакопления";
	НоваяСтрока.Синоним					= "Регистры накопления";
	НоваяСтрока.Представление			= "Регистры накопления";
	НоваяСтрока.ЭтоГруппа				= Истина;
	
КонецПроцедуры

Функция ОбъектыСПоказателями()
	
	МассивМетаданных = Новый Массив;
	
	ПоказателиОбъектовПереопределяемый.ОпределитьОбъектыСПоказателями(МассивМетаданных);
	
	Возврат МассивМетаданных;
	
КонецФункции

Функция ТриггерыРасчетаПоказателей()
	
	МассивМетаданных = Новый Массив;
	
	ПоказателиОбъектовПереопределяемый.ОпределитьТриггерыРасчетаПоказателей(МассивМетаданных);
	
	Возврат  МассивМетаданных;
	
КонецФункции

Процедура ЗарегистрироватьОбъектМетаданныхВКоллекции(
	КоллекцияМетаданных, ОбъектМетаданных, МожетИметьПоказатели = Неопределено, ЯвляетсяТриггером = Неопределено)
	
	ПолноеИмя = ОбъектМетаданных.ПолноеИмя();
	
	Слова = СтрРазделить(ПолноеИмя, ".");
	ТипМетаданных = Слова[0];
	
	Если ТипМетаданных = "РегистрСведений" Тогда
		ТипМетаданныхПредставление = "Регистр сведений";
	ИначеЕсли ТипМетаданных = "РегистрНакопления" Тогда
		ТипМетаданныхПредставление = "Регистр накопления";
	ИначеЕсли ТипМетаданных = "РегистрБухгалтерии" Тогда
		ТипМетаданныхПредставление = "Регистр бухгалтерии";
	ИначеЕсли ТипМетаданных = "РегистрРасчета" Тогда
		ТипМетаданныхПредставление = "Регистр расчета";
	ИначеЕсли ТипМетаданных = "ПланВидовХарактеристик" Тогда
		ТипМетаданныхПредставление = "План видов характеристик";
	Иначе
		ТипМетаданныхПредставление = ТипМетаданных;
	КонецЕсли;
	
	ПоискСтрок = КоллекцияМетаданных.НайтиСтроки(Новый Структура("ПолноеИмя", ПолноеИмя));
	
	Если (ПоискСтрок.Количество() = 0) Тогда
		
		СтрокаКоллекции = КоллекцияМетаданных.Добавить();
		СтрокаКоллекции.Имя 			= ОбъектМетаданных.Имя;
		СтрокаКоллекции.ПолноеИмя		= ПолноеИмя;
		СтрокаКоллекции.Синоним			= ОбъектМетаданных.Синоним;
		СтрокаКоллекции.Представление	= СтрШаблон("%1 (%2)", ОбъектМетаданных.Синоним, ТипМетаданныхПредставление);
		
		ПоискРодителя = КоллекцияМетаданных.НайтиСтроки(Новый Структура("ПолноеИмя", ТипМетаданных));
		Если ПоискРодителя.Количество() > 0 Тогда
			СтрокаКоллекции.Родитель = ПоискРодителя[0].УникальныйИдентификатор;
		КонецЕсли; 
		
	Иначе
		
		СтрокаКоллекции = ПоискСтрок[0];
		
	КонецЕсли;
	
	Если (МожетИметьПоказатели <> Неопределено) Тогда
		СтрокаКоллекции.МожетИметьПоказатели = МожетИметьПоказатели;
	КонецЕсли;
	
	Если (ЯвляетсяТриггером <> Неопределено) Тогда
		СтрокаКоллекции.ЯвляетсяТриггером = ЯвляетсяТриггером;
	КонецЕсли;
	
КонецПроцедуры

// Добавляет, изменяет данные в справочник. Помечает на удаление неактуальные элементы справочника.
Процедура ЗаписатьКоллекциюМетаданныхВСправочник(КоллекцияМетаданных)
	
	НачатьТранзакцию();
	
	Блокировка = Новый БлокировкаДанных();
	
	ЭлементБлокировки = Блокировка.Добавить("Справочник.ОбъектыМетаданныхПО");
	ЭлементБлокировки.Режим = РежимБлокировкиДанных.Исключительный;
	
	Блокировка.Заблокировать();
	
	КоллекцияМетаданных.Колонки.Добавить("Ссылка", Новый ОписаниеТипов("СправочникСсылка.ОбъектыМетаданныхПО"));
	КоллекцияМетаданных.Колонки.Добавить("РодительСсылка", Новый ОписаниеТипов("СправочникСсылка.ОбъектыМетаданныхПО"));
	
	Для Каждого ТекущаяСтрока Из КоллекцияМетаданных Цикл
		ТекущаяСтрока.Ссылка = Справочники.ОбъектыМетаданныхПО.ПолучитьСсылку(ТекущаяСтрока.УникальныйИдентификатор);
		ТекущаяСтрока.РодительСсылка = Справочники.ОбъектыМетаданныхПО.ПолучитьСсылку(ТекущаяСтрока.Родитель);
	КонецЦикла;
	
	Запрос = Новый Запрос;
	Запрос.УстановитьПараметр("КоллекцияМетаданных", КоллекцияМетаданных);
	
	Запрос.Текст =
		"ВЫБРАТЬ
		|	КоллекцияМетаданных.Ссылка КАК Ссылка,
		|	КоллекцияМетаданных.РодительСсылка КАК РодительСсылка,
		|	КоллекцияМетаданных.ПолноеИмя КАК ПолноеИмя,
		|	КоллекцияМетаданных.Имя КАК Имя,
		|	КоллекцияМетаданных.Синоним КАК Синоним,
		|	КоллекцияМетаданных.Представление КАК Представление,
		|	КоллекцияМетаданных.ЭтоГруппа КАК ЭтоГруппа,
		|	КоллекцияМетаданных.МожетИметьПоказатели КАК МожетИметьПоказатели,
		|	КоллекцияМетаданных.ЯвляетсяТриггером КАК ЯвляетсяТриггером
		|ПОМЕСТИТЬ КоллекцияМетаданных
		|ИЗ
		|	&КоллекцияМетаданных КАК КоллекцияМетаданных
		|;
		|////////////////////////////////////////////////////////////////////////////////
		|// Новые элементы
		|ВЫБРАТЬ
		|	КоллекцияМетаданных.Ссылка КАК Ссылка,
		|	КоллекцияМетаданных.РодительСсылка КАК РодительСсылка,
		|	КоллекцияМетаданных.ПолноеИмя КАК ПолноеИмя,
		|	КоллекцияМетаданных.Имя КАК Имя,
		|	КоллекцияМетаданных.Синоним КАК Синоним,
		|	КоллекцияМетаданных.Представление КАК Представление,
		|	КоллекцияМетаданных.ЭтоГруппа КАК ЭтоГруппа,
		|	КоллекцияМетаданных.МожетИметьПоказатели КАК МожетИметьПоказатели,
		|	КоллекцияМетаданных.ЯвляетсяТриггером КАК ЯвляетсяТриггером
		|ИЗ
		|	КоллекцияМетаданных КАК КоллекцияМетаданных
		|		ЛЕВОЕ СОЕДИНЕНИЕ Справочник.ОбъектыМетаданныхПО КАК ОбъектыМетаданныхПО
		|		ПО ОбъектыМетаданныхПО.Ссылка = КоллекцияМетаданных.Ссылка
		|		ИЛИ (ОбъектыМетаданныхПО.ПолноеИмя = КоллекцияМетаданных.ПолноеИмя
		|		И ОбъектыМетаданныхПО.ЭтоГруппа = КоллекцияМетаданных.ЭтоГруппа)
		|ГДЕ
		|	ОбъектыМетаданныхПО.Ссылка ЕСТЬ NULL
		|;
		|////////////////////////////////////////////////////////////////////////////////
		|// Элементы, которые надо обновить
		|ВЫБРАТЬ
		|	КоллекцияМетаданных.Ссылка КАК Ссылка,
		|	КоллекцияМетаданных.РодительСсылка КАК РодительСсылка,
		|	КоллекцияМетаданных.Синоним КАК Синоним,
		|	КоллекцияМетаданных.Представление КАК Представление,
		|	КоллекцияМетаданных.ЭтоГруппа КАК ЭтоГруппа,
		|	КоллекцияМетаданных.МожетИметьПоказатели КАК МожетИметьПоказатели,
		|	КоллекцияМетаданных.ЯвляетсяТриггером КАК ЯвляетсяТриггером
		|ИЗ
		|	КоллекцияМетаданных КАК КоллекцияМетаданных
		|		ЛЕВОЕ СОЕДИНЕНИЕ Справочник.ОбъектыМетаданныхПО КАК ОбъектыМетаданныхПО
		|		ПО КоллекцияМетаданных.Ссылка = ОбъектыМетаданныхПО.Ссылка
		|ГДЕ
		|	НЕ (КоллекцияМетаданных.РодительСсылка = ОбъектыМетаданныхПО.Родитель
		|	И КоллекцияМетаданных.Синоним = ОбъектыМетаданныхПО.Синоним
		|	И КоллекцияМетаданных.Представление = ОбъектыМетаданныхПО.Наименование)
		|
		|ОБЪЕДИНИТЬ ВСЕ
		|
		|ВЫБРАТЬ
		|	ОбъектыМетаданныхПО.Ссылка,
		|	КоллекцияМетаданных.РодительСсылка,
		|	КоллекцияМетаданных.Синоним,
		|	КоллекцияМетаданных.Представление,
		|	КоллекцияМетаданных.ЭтоГруппа,
		|	КоллекцияМетаданных.МожетИметьПоказатели,
		|	КоллекцияМетаданных.ЯвляетсяТриггером
		|ИЗ
		|	КоллекцияМетаданных КАК КоллекцияМетаданных
		|		ЛЕВОЕ СОЕДИНЕНИЕ Справочник.ОбъектыМетаданныхПО КАК ОбъектыМетаданныхПО
		|		ПО КоллекцияМетаданных.ПолноеИмя = ОбъектыМетаданныхПО.ПолноеИмя
		|		И КоллекцияМетаданных.ЭтоГруппа = ОбъектыМетаданныхПО.ЭтоГруппа
		|		И КоллекцияМетаданных.Ссылка = ЗНАЧЕНИЕ(Справочник.ОбъектыМетаданныхПО.ПустаяСсылка)
		|ГДЕ
		|	НЕ (КоллекцияМетаданных.РодительСсылка = ОбъектыМетаданныхПО.Родитель
		|	И КоллекцияМетаданных.Синоним = ОбъектыМетаданныхПО.Синоним
		|	И КоллекцияМетаданных.Представление = ОбъектыМетаданныхПО.Наименование
		|	И КоллекцияМетаданных.МожетИметьПоказатели = ОбъектыМетаданныхПО.МожетИметьПоказатели
		|	И КоллекцияМетаданных.ЯвляетсяТриггером = ОбъектыМетаданныхПО.ЯвляетсяТриггером)
		|;
		|////////////////////////////////////////////////////////////////////////////////
		|// Неактуальные элементы
		|ВЫБРАТЬ
		|	ОбъектыМетаданныхПО.Ссылка КАК Ссылка
		|ИЗ
		|	Справочник.ОбъектыМетаданныхПО КАК ОбъектыМетаданныхПО
		|		ЛЕВОЕ СОЕДИНЕНИЕ КоллекцияМетаданных КАК КоллекцияМетаданных
		|		ПО ОбъектыМетаданныхПО.ПолноеИмя = КоллекцияМетаданных.ПолноеИмя
		|		ИЛИ ОбъектыМетаданныхПО.Ссылка = КоллекцияМетаданных.Ссылка
		|ГДЕ
		|	КоллекцияМетаданных.Ссылка ЕСТЬ NULL
		|	И
		|	НЕ ОбъектыМетаданныхПО.ПометкаУдаления";
		
	РезультатыЗапроса = Запрос.ВыполнитьПакет();
	
	ВыборкаСоздать = РезультатыЗапроса[1].Выбрать();
	ВыборкаОбновить = РезультатыЗапроса[2].Выбрать();
	ВыборкаПометитьНаУдаление = РезультатыЗапроса[3].Выбрать();
	
	// Создание новых элементов
	Пока ВыборкаСоздать.Следующий() Цикл
		
		ОбъектСправочника = ?(ВыборкаСоздать.ЭтоГруппа,
			Справочники.ОбъектыМетаданныхПО.СоздатьГруппу(),
			Справочники.ОбъектыМетаданныхПО.СоздатьЭлемент());
		
		Если ЗначениеЗаполнено(ВыборкаСоздать.Ссылка) Тогда
			ОбъектСправочника.УстановитьСсылкуНового(ВыборкаСоздать.Ссылка);
		КонецЕсли;
		
		ОбъектСправочника.Наименование			= ВыборкаСоздать.Представление;
		ОбъектСправочника.Имя					= ВыборкаСоздать.Имя;
		ОбъектСправочника.Синоним				= ВыборкаСоздать.Синоним;
		ОбъектСправочника.ПолноеИмя				= ВыборкаСоздать.ПолноеИмя;
		ОбъектСправочника.Родитель				= ВыборкаСоздать.РодительСсылка;
		
		Если Не ВыборкаСоздать.ЭтоГруппа Тогда
			ОбъектСправочника.МожетИметьПоказатели	= ВыборкаСоздать.МожетИметьПоказатели;
			ОбъектСправочника.ЯвляетсяТриггером		= ВыборкаСоздать.ЯвляетсяТриггером;
		КонецЕсли;
		
		ОбъектСправочника.Записать();
		
	КонецЦикла;
	
	// Обновление текущих элементов
	Пока ВыборкаОбновить.Следующий() Цикл
		
		ОбъектСправочника = ВыборкаОбновить.Ссылка.ПолучитьОбъект();
		
		ОбъектСправочника.Наименование			= ВыборкаОбновить.Представление;
		ОбъектСправочника.Синоним				= ВыборкаОбновить.Синоним;
		ОбъектСправочника.Родитель				= ВыборкаОбновить.РодительСсылка;
		ОбъектСправочника.МожетИметьПоказатели	= ВыборкаОбновить.МожетИметьПоказатели;
		ОбъектСправочника.ЯвляетсяТриггером		= ВыборкаОбновить.ЯвляетсяТриггером;
		
		ОбъектСправочника.Записать();
		
	КонецЦикла;
	
	// Пометка на удаление неактуальных элементов
	Пока ВыборкаПометитьНаУдаление.Следующий() Цикл
		
		ОбъектСправочника = ВыборкаПометитьНаУдаление.Ссылка.ПолучитьОбъект();
		ОбъектСправочника.УстановитьПометкуУдаления(Истина, Ложь);
		
	КонецЦикла;
	
	ЗафиксироватьТранзакцию();
	
КонецПроцедуры

#КонецОбласти
	
#КонецЕсли