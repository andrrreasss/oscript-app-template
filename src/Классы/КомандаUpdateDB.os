///////////////////////////////////////////////////////////////////////////////
//
// Служебный модуль с реализацией работы команды
//
///////////////////////////////////////////////////////////////////////////////

Процедура НастроитьКоманду(Знач Команда, Знач Парсер) Экспорт

	// Добавление параметров команды
	// Парсер.ДобавитьПозиционныйПараметрКоманды(Команда, "ИмяПараметра", "Описание параметра");
	// Парсер.ДобавитьИменованныйПараметрКоманды(Команда, "ИмяПараметра", "Описание параметра");
	// Парсер.ДобавитьПараметрФлагКоманды(Команда, "ИмяПараметра", "Описание параметра");
	// Парсер.ДобавитьПараметрКоллекцияКоманды(Команда, "ИмяПараметра", "Описание параметра");
	// Парсер.ДобавитьИменованныйПараметрКоллекцияКоманды(Команда, "ИмяПараметра", "Описание параметра");

КонецПроцедуры // НастроитьКоманду

// Выполняет логику команды
// 
// Параметры:
//   ПараметрыКоманды - Соответствие - Соответствие ключей командной строки и их значений
//   Приложение - Модуль - Модуль менеджера приложения
//
Функция ВыполнитьКоманду(Знач ПараметрыКоманды, Знач Приложение) Экспорт
	
	ВызватьИсключение "Не реализовано";

	// При успешном выполнении возвращает код успеха
	Возврат Приложение.РезультатыКоманд().Успех;
	
КонецФункции // ВыполнитьКоманду
