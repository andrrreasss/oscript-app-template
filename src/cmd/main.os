#Использовать cli
#Использовать tempfiles
#Использовать "../core"
#Использовать "."

Перем Лог;
Перем Плагины;
Перем ВерсияПлатформы;
Перем ВыводДополнительнойИнформации;
Перем ВременныйКаталогРаботы;
Перем ДоменПочты;
///////////////////////////////////////////////////////////////////////////////

Процедура ВыполнитьПриложение()

	Приложение = Новый КонсольноеПриложение(ПараметрыПриложения.ИмяПриложения(), 
					"Приложение для обновления информационных баз 1С",
					ЭтотОбъект);
	
	Приложение.Версия("version", ПараметрыПриложения.Версия());

	Приложение.Запустить(АргументыКоманднойСтроки);

КонецПроцедуры // ВыполнениеКоманды()	

Процедура ВыполнитьКоманду(Знач КомандаПриложения) Экспорт
	
	КомандаПриложения.ВывестиСправку();

КонецПроцедуры

Процедура ПередВыполнениемКоманды(Знач Команда) Экспорт

	ВерсияПлатформы = Команда.ЗначениеОпции("v8version");
	ПутьКПлатформе = Команда.ЗначениеОпции("v8-path");
	ВыводДополнительнойИнформации = Команда.ЗначениеОпции("verbose");
	ПутьКГит = Команда.ЗначениеОпции("git-path");
	ВременныйКаталогРаботы = Команда.ЗначениеОпции("tempdir");
	ДоменПочты = Команда.ЗначениеОпции("domain-email");
	
	ПараметрыПриложения.УстановитьРежимОтладкиПриНеобходимости(ВыводДополнительнойИнформации);

	Лог.Отладка("Устанавливаю общие параметры");
	ПараметрыПриложения.УстановитьВерсиюПлатформы(ВерсияПлатформы);
	ПараметрыПриложения.УстановитьПутьКПлатформе(ПутьКПлатформе);
	ПараметрыПриложения.УстановитьПутьКГит(ПутьКГит);
	ПараметрыПриложения.УстановитьДоменПочты(ДоменПочты);
	ПараметрыПриложения.УстановитьВременныйКаталог(ВременныйКаталогРаботы);
	
КонецПроцедуры

Лог = ПараметрыПриложения.Лог();
ПараметрыПриложения.ПодготовитьПлагины(); 

Попытка

	ВыполнитьПриложение();

Исключение

	Лог.КритичнаяОшибка(ОписаниеОшибки());
	ВременныеФайлы.Удалить();

	ЗавершитьРаботу(1);

КонецПопытки;