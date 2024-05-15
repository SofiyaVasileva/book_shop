import 'package:flutter/material.dart';
import 'package:vasilueva_bookshop/main.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

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