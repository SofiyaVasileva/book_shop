import 'package:flutter/material.dart';
import 'package:vasilueva_bookshop/data.dart';
import 'package:vasilueva_bookshop/favorite.dart';
import 'package:vasilueva_bookshop/item_card.dart';


const List<String> titlies = <String>["Фактор дисбаланса", "Демон из Пустоши. Колдун Российской империи", "Жизнь за жизнь", "Граф Аверин. Колдун Российской империи", "Политические режимы и трансформации: Россия в сравнительной перспективе"];
const List<String> authors = <String>["Макс Глебов", "Виктор Дашкевич", "Елена Паленова", "Виктор Дашкевич", "Григорий Голосов"];


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
  int _selectedIndex = 0;


static final List<Widget> _pages = <Widget>[
    const Column(children: [
      Column(crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/512/147/147133.png')
        ),
        Text('Фамильцев Имян Отчествович', style: TextStyle(fontSize: 30),
        ),
        Text('pochta@gmail.com', style: TextStyle(fontSize: 20)
        ),
      ],
    ),
    Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('История покупок'),
                Text("Tom", style: TextStyle(fontSize: 15)),
                Text("Alice", style: TextStyle(fontSize: 15)),
                Text("Bob", style: TextStyle(fontSize: 15)),
                Text("Sam", style: TextStyle(fontSize: 15)),
                Text("Kate", style: TextStyle(fontSize: 15)),
              ],
        ),
    ]),

  GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 0.30,
    crossAxisSpacing: 10,
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
   itemCount: titlies.length,
   itemBuilder: (BuildContext context, int index) {
      return ShoppingCart(nameBook: bookList[index].name, bookAuthor: bookList[index].author);
       }
    ),
  
  GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 0.30,
    crossAxisSpacing: 10,
    mainAxisSpacing: 5
    ),
  itemCount: FavList.length,
  itemBuilder: (BuildContext context, int  index) {
    return FavCatalog(nameBook: FavList[index].name, bookCover: FavList[index].cover, bookAuthor: FavList[index].author, shortDesc: FavList[index].desc,);
  }
  ),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('РитЛес', 
        style: TextStyle(
          color: Colors.white)
          ),
        backgroundColor: const Color.fromARGB(255, 49, 101, 107),
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
