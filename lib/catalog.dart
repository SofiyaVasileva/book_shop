import 'package:flutter/material.dart';
import 'package:vasilueva_bookshop/data.dart';


const List<String> users = <String>["Фактор дисбаланса", "Демон из Пустоши. Колдун Российской империи", "Жизнь за жизнь", "Граф Аверин. Колдун Российской империи", "Политические режимы и трансформации: Россия в сравнительной перспективе"];
const List<String> companies = <String>["Макс Глебов", "Виктор Дашкевич", "Елена Паленова", "Виктор Дашкевич", "Григорий Голосов"];


class MainPage extends StatefulWidget{
  const MainPage({ super.key});
  @override
  // ignore: library_private_types_in_public_api
  _MainPagerState createState() => _MainPagerState();
}
class _MainPagerState extends State<MainPage>{
  
  void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
  }
  int value = 0;
  int _selectedIndex = 0;
 
static final List<Widget> _pages = <Widget>[
    const Column(children: [
    Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/512/147/147133.png')
    ),
    Text('Фамильцев Имян Отчествович', style: TextStyle(fontSize: 30),
    ),
    Text('pochta@gmail.com', style: TextStyle(fontSize: 20)
    ),
    Text('История покупок'
    )   
    ]),

  GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 0.49,
    crossAxisSpacing: 20,
    mainAxisSpacing: 5
    ),
  itemCount: bookList.length,
  itemBuilder: (BuildContext context, int  index) {
    return ConstrCatalog(nameBook: bookList[index].name, bookCover: bookList[index].cover, bookAuthor: bookList[index].author, shortDesc: bookList[index].desc,);
  }
  ),
//Листвью, товары, +-, подстчет общей суммы стоимости
  ListView.builder(
   padding: const EdgeInsets.all(8),
   itemCount: users.length,
  itemBuilder: (BuildContext context, int index) {
      return Container(
       padding: EdgeInsets.symmetric(vertical: 10),
       child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text(users[index], style: TextStyle(fontSize: 22)),
              Text("Автор: ${companies[index]}", style: TextStyle(fontSize: 18))
            ],
          ),
         );
       }
    ),
  
  const Icon(
    //Как товары, но все с активными сердцами
    
    Icons.favorite_border_outlined,
    size: 150,
  ),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('РитЛес'),
      ),
      body: Center(
      child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedIconTheme: const IconThemeData(
        color: Color.fromARGB(255, 49, 101, 107),
        ),

         selectedFontSize: 20,
          selectedIconTheme: const IconThemeData(color: Color.fromARGB(255, 149, 31, 189), size: 20),
          selectedItemColor: const Color.fromARGB(255, 149, 31, 189),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),

         items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Personal Office',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: 'Catalog',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Shopping cart',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              label: 'Favorites',
         ),
         
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
