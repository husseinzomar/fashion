import 'package:fashion/screens/bottomnavbar/searchresult.dart';
import 'package:fashion/widgets/item.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

List<String> categoryName = ['Men', 'Women', 'Devices', 'Shoes', 'Accessories', 'Bags'];

List<IconData> categoryIcon = [Icons.shop, Icons.shopping_basket, Icons.shopping_cart, Icons.short_text, Icons.show_chart, Icons.shuffle];

List<String> itemName = ['Chair', 'Lamp', 'Home', 'Office'];

List<String> itemImage = ['assets/chair.jpg', 'assets/lamp.jpg', 'assets/home.jpg', 'assets/office.jpg'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          padding: EdgeInsets.only(top: 60.0),
          scrollDirection: Axis.vertical,
          children: [
            ListTile(
              title: Container(
                padding: EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 20.0),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(15.0),
                ),
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.search,
                  color: Color(0xff0073a6),
                  size: 20.0,
                ),
              ),
              trailing: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xff0073a6),
                  shape: BoxShape.circle
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 20.0
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Categories',
                style: TextStyle(color: Color(0xff0073a6), fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                'see all',
                style: TextStyle(color: Color(0xff0073a6), fontSize: 15.0, fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              height: 75.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryIcon.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120.0,
                    child: ListTile(
                      title: Icon(categoryIcon[index], color: Color(0xff0073a6), size: 20.0),
                      subtitle: Text(categoryName[index], textAlign: TextAlign.center, style: TextStyle(color: Color(0xff0073a6), fontSize: 20.0 )),
                      onTap: () {},
                    ),
                  );
                },
              )
            ),
            ListTile(
              title: Text(
                'Best Selling',
                style: TextStyle(color: Color(0xff0073a6), fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                'see all',
                style: TextStyle(color: Color(0xff0073a6), fontSize: 15.0, fontWeight: FontWeight.normal),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {return SearchResult('Best Selling');}));
              },
            ),
            Container(
              height: MediaQuery.of(context).size.height/2.3,
              child: homePageItem(),
            ),
            ListTile(
              title: Text(
                'New Arrival',
                style: TextStyle(color: Color(0xff0073a6), fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                'see all',
                style: TextStyle(color: Color(0xff0073a6), fontSize: 15.0, fontWeight: FontWeight.normal),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {return SearchResult('New Arrival');}));
              },
            ),
            Container(
              height: MediaQuery.of(context).size.height/2.3,
              child: homePageItem(),
            ),
          ],
        ),
      ),
    );
  }
  homePageItem() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemName.length,
      itemBuilder: (context, index){
        return Item(itemImage[index], itemName[index], '!order');
      }
    );
  }
}