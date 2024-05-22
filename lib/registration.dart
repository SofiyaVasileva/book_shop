import 'package:flutter/material.dart';
import 'package:vasilueva_bookshop/main.dart';
bool? check1 = false;
class SecondRoute extends StatefulWidget {
  const SecondRoute({super.key});

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация', style: TextStyle(
          color: Colors.white)
        ),
      backgroundColor: const Color.fromARGB(255, 49, 101, 107),
      ),
      body: Center(
        child:
        Column(
            children: [
              Container(
                margin: const EdgeInsetsDirectional.only(bottom: 10),
                constraints: const BoxConstraints (maxWidth: 250, maxHeight: 350),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('Введите свой логин',
                          style: TextStyle(
                            fontSize: 20,
                          )
                      ),
                      const TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Телефон или e-mail",
                              fillColor: Color.fromARGB(49, 66, 0, 131),
                              filled: true
                          )
                      ),
                      const Text('Введите новый пароль',
                          style: TextStyle(
                            fontSize: 20,
                          )
                      ),
                      const TextField(decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Введите пароль",
                          fillColor: Color.fromARGB(31, 0, 117, 130),
                          filled: true
                      )
                      ),
                       Row(
                          children: [
                            Checkbox(
                              value: check1,
                              onChanged: (value) {
                                setState(() {
                                check1 = value;
                                 });
                                 },
                              tristate: false,
                            ),
                            Container(
                              constraints: const BoxConstraints (maxWidth: 200),
                              child: const Text(
                                'Я ознакомлен(а) с Политикой конфиденциальности и согласен(а) на обработку персональных данных',
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 61, 61, 61)
                                ),
                              ),
                            )
                          ],
                        ),
                      ElevatedButton(
                          child: const Text('Зарегестрироваться'),
                          onPressed:(){
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const FirstRoute()),
                            );
                          }
                      ),
                    ]
                ),
              ),
            ]
        ),
      ),
    );
  }
}