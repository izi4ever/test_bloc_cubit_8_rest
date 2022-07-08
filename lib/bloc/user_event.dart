abstract class UserEvent {}          // Абстрактный класс, группирующий (обобщающий) все события ниже

class UserLoadEvent extends UserEvent {}        // Событие нажатия на кнопку Загрузить
class UserClearEvent extends UserEvent {}       // Событие нажатия на кнопку Очистить