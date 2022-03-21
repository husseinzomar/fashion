import 'package:flutter/material.dart';



class Item extends StatefulWidget {

final String itemImage;
final String itemName;
final String className;

Item(this.itemImage, this.itemName, this.className);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {

bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
          child: Container(
        height: widget.className == 'order' ? MediaQuery.of(context).size.height/2.2 : null,
        width: MediaQuery.of(context).size.width/2,
        margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        child: Column(
          children: [
            Container(
              height: 150.0,
              decoration: BoxDecoration(
              image: DecorationImage(
              image: AssetImage(widget.itemImage), fit: BoxFit.fill)),
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(pressed == false ? Icons.favorite_border : Icons.favorite),
                color: Colors.red,
                iconSize: 20.0,
                onPressed: () {
                  setState(() {
                    pressed = !pressed;
                  });
                },
              ),
            ),
            ListTile(
              title: Text(
                widget.itemName,
                style: TextStyle(
                    color: Color(0xff0073a6),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chair Description',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    '225\$',
                    style: TextStyle(
                        color: Color(0xff0073a6),
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}