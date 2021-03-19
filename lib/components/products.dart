import 'package:flutter/material.dart';
import 'package:shopsolutions/pages/product_detail.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  var product_list = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Red dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Red dress",
      "picture": "images/products/hills1.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Red dress",
      "picture": "images/products/blazer2.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Red dress",
      "picture": "images/products/skt2.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Red dress",
      "picture": "images/products/dress2.jpeg",
      "old_price": 100,
      "price": 50,
    },

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
        ),
        itemBuilder: (BuildContext context, int index) {
        return Single_prod(
          product_name: product_list[index]['name'],
          prod_picture: product_list[index]['picture'],
          prod_old_price: product_list[index]['old_price'],
          prod_price: product_list[index]['price'],
        );
        });
  }
}

class Single_prod extends StatelessWidget {
  final product_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod({
    this.product_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price
});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(tag: Text('hero 1'), child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(
            product_detail_name: product_name,
            product_detail_new_price: prod_price,
            product_detail_old_price: prod_old_price,
            product_detail_picture: prod_picture,
          )));
        },
        child: GridTile(
            footer: Container(
              color: Colors.white70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(product_name,style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0
                    ),),
                  ),
                  Text("\$${prod_price}",style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold
                  ),)
                ],
              )
            ),
            child: Image.asset(prod_picture,
            fit: BoxFit.cover,
            )),
      )),
    );
  }
}

