class User {
  int id;
  String name;
  String? email;              // >>> Знак вопроса в конце типа означает, что переменная может принимать null,
  String? phone;              // >>> т.е. является не обязательным полем

  User({                      // Конструктор класса
    required this.id,         // Обязательное поле (параметр функции)
    required this.name,
    this.email,               // Не обязательное поле
    this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {      // json — входной параметр типа Map<String, dynamic>
    return User(                        // Для каждого поля из модели назначаем переменную из json
      id: json['id'],
      name: json['name'],
      email: json['email'] ?? '',       // Если email или phone не придут, то отобразим пустую строку
      phone: json['phone'] ?? '',       // Т.к. этих 2 поля являются не обязательными
    );
  }
}
