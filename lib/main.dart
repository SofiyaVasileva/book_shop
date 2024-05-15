import 'package:flutter/material.dart';
import 'package:vasilueva_bookshop/registration.dart';
import 'package:vasilueva_bookshop/catalog.dart';
void main() {
  runApp(const MaterialApp(
    title: 'BookShop',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добро пожаловать!', style: TextStyle(
            color: Colors.white
        )
          ,),
        backgroundColor: const Color.fromARGB(255, 49, 101, 107),
      ),
      body: Center(
          child: Container( margin: const EdgeInsets.all(20),

            child: Column(
              children: [
                const Text('Для продолжения Вам необходимо пройти авторизацию.',
                    style: TextStyle(
                      fontSize: 20,
                    )
                ),
                Container(
                  margin: const EdgeInsetsDirectional.only(bottom: 10),
                  constraints: const BoxConstraints (maxWidth: 200),
                  child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Телефон или e-mail',
                            style: TextStyle(
                              fontSize: 20,
                            )
                        ),
                        TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Введите логин",
                                fillColor: Color.fromARGB(49, 66, 0, 131),
                                filled: true
                            )
                        ),
                        Text('Пароль',
                            style: TextStyle(
                              fontSize: 20,
                            )
                        ),
                        TextField(decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Введите пароль",
                            fillColor: Color.fromARGB(31, 0, 117, 130),
                            filled: true
                        )
                        )
                      ]
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          child: const Text('Войти'),
                          onPressed:(){
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MainPage()),
                            );
                          }
                      ),
                      TextButton(
                        child: const Text('Регистрация'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SecondRoute()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
