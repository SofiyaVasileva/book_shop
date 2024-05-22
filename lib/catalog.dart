import 'package:flutter/material.dart';
import 'package:vasilueva_bookshop/data.dart';

class MainPage extends StatefulWidget{
  const MainPage({ super.key});
  @override
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
  Column(children: [
  const Column(children: [
    Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/512/147/147133.png')
    ),
    Text('Фамилиевич Имян Отчествович',),
    Text('pochta@gmail.com'),
  ]
  ),
  Container(
    //Старые покупки
  )
  ]
  ),

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

  const Icon(
    //Листвью, товары, +-, подстчет общей суммы стоимости
    Icons.shopping_cart,
    size: 150,
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
        title: const Text('Каталог'),
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
