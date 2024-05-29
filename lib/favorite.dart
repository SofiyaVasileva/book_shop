import 'package:flutter/material.dart';

class FavCatalog extends StatefulWidget {
  const FavCatalog({super.key, required this.nameBook, required this.bookCover, required this.bookAuthor, required this.shortDesc});
  final String nameBook;
  final String bookCover;
  final String bookAuthor;
  final String shortDesc;

  @override
  State<FavCatalog> createState() => _FavCatalogState();
}

class _FavCatalogState extends State<FavCatalog> {
  late Color _buttonColor;
  @override
  void initState() {
    //Начальное значение цвета кнопки
    _buttonColor =  Colors.red;
    super.initState();
  }

 int value = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Center(
            child: Text(widget.nameBook,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),),
            ),
          Center(
            child: Image.network(widget.bookCover),
          ),
          Center(
            child: Text('Автор: ${widget.bookAuthor}',
            softWrap: true,
            maxLines: 5,
            style: const TextStyle(fontSize: 15),
            ),
          ),
          Center(
            child: Text('Краткое описание: ${widget.shortDesc}',
            softWrap: true,
            overflow: TextOverflow.fade,
            maxLines: 5,
            style: const TextStyle(fontSize: 12),
            ),
          ),
          Row(children: [
            const SizedBox(
                width: 20,
              ),
              Badge(
                  label: Text('$value'),
                  child: IconButton(
                      onPressed: () {setState(() {
                    value++;
                  });}, 
                  icon: const Icon(Icons.shopping_cart))),
                  const SizedBox(
                    width: 20,
                  ),
            IconButton(
                  icon: const Icon(Icons.favorite),
                  color:  _buttonColor,
                  onPressed: () {
                      setState(() {
                      if (_buttonColor == Colors.red) {
                        _buttonColor = Colors.red;
                      } else {
                        _buttonColor = Colors.red;
                      }
                    },
                  );
                }
             )
          ],
         )
        ]
        ),
    );
  }
}

class Catalog {
  int id;
  String name;
  String cover;
  String author;
  String desc;
  Catalog(this.id, this.name, this.cover, this.author, this.desc);
}

List<Catalog>FavList = [
  Catalog(1, "Фактор дисбаланса", "https://cv1.litres.ru/pub/c/cover_415/70620715.webp", "Макс Глебов", "Договоренности с кибами и единственным выжившим тайкуном дают Сергею Белову множество новых возможностей, но при этом сильно растут и риски."),
  Catalog(2,"Демон из Пустоши. Колдун Российской империи","https://cv2.litres.ru/pub/c/cover_415/70473427.webp","Виктор Дашкевич","Третья книга о расследованиях графа Аверина. После битвы с Императорским дивом Кузя, пожертвовав собой, попадает в Пустошь – Ледяную пустыню, где обитают дивы. Граф Аверин не знает, жив ли он, но намерен открыть коридор в мир дивов и любой ценой попытаться спасти своего друга. Считается, что человек, попав туда, погибает сразу же. Но так ли это?"),
  Catalog(3,"Жизнь за жизнь","https://cv4.litres.ru/pub/c/cover_415/68537145.webp","Елена Паленова","Вторая книга серии «ОДАРЁННЫЕ».Вопреки пророчеству старой ведьмы об отсутствии общих детей с бывшим женихом, Юля узнаёт, что беременна от Саши. Обстоятельства складываются далеко не в пользу появления на свет этого ребёнка – отношения с матерью у девушки сложные, работу найти не получается, и доктора в один голос твердят, что Юле после болезни ещё рано думать о детях. Вдобавок к реальным препятствиям есть и те, которые связаны с магическими способностями Юли. Чтобы принять окончательное решение, она хочет посоветоваться с Сашей, ведь это и его ребёнок тоже, но выясняет, что бывший жених угодил в психиатрическую клинику. Помочь молодому человеку может только влюблённый в Юлю Андрей Турин, поскольку болезнь Александра берёт начало в мире мёртвых, а девушке, если она хочет сохранить ребёнка, прикасаться к чёрной магии нельзя."),
  Catalog(4,"Граф Аверин. Колдун Российской империи","https://cv0.litres.ru/pub/c/cover_415/69526501.webp","Виктор Дашкевич","Первая книга серии о расследованиях графа Аверина. Граф Аверин расследует убийство дворянского сына, в котором обвиняют дивов, жестоких магических существ из Пустоши. Они подчиняются людям, но выходят из-под контроля, стоит почувствовать кровь или слабость хозяина."),
  Catalog(5,"Политические режимы и трансформации: Россия в сравнительной перспективе","https://cv4.litres.ru/pub/c/cover_415/70579741.webp","Григорий Голосов","В книге представлена классификация политических режимов, позволяющая ввести анализ современной российской политики в широкий сравнительный контекст. На основе изучения опыта целого ряда зарубежных стран рассмотрены проблемы трансформации политических режимов, что позволяет обосновать некоторые выводы о перспективах российского политического развития. Предложены институциональные решения, которые позволили бы оптимизировать переходные политические процессы и функционирование демократической государственности."),
];