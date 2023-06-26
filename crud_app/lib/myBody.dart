import 'package:flutter/material.dart';

import './product.dart';
import './productDetails.dart';

class MyBody extends StatelessWidget {
  const MyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dummy E-commerce site",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: myContent(),
    );
  }
}

class myContent extends StatelessWidget {
  const myContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dummy E-commerce site")),
      body: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  MyWidget({super.key});

  final List<Product> products = [
    Product(
      "Iphone 14",
      1250,
      "Iphone 14 is the latest iphone",
      "https://imageio.forbes.com/specials-images/imageserve/632390a30a2e4c22de06509d/0x0.jpg?format=jpg&crop=1839,1379,x168,y126,safe&width=1200",
    ),
    Product(
      "Galaxy s22",
      1100,
      "Galaxy s22 is the latest galaxy phone from Samsung",
      "https://www.deccanherald.com/sites/dh/files/styles/article_detail/public/articleimages/2022/05/04/sgs22-cov-sho-1-1106153-1651652208.jpg?itok=rIWzcTFw",
    ),
    Product(
      "MacBook Pro",
      2000,
      "MacBook Pro is a high-end laptop by Apple",
      "https://cdn.pixabay.com/photo/2016/03/27/07/12/apple-1282240__340.jpg",
    ),
    Product(
      "Sony Playstation 5",
      500,
      "Playstation 5 is the latest gaming console by Sony",
      "https://www.lowyat.net/wp-content/webp-express/webp-images/doc-root/wp-content/uploads/2022/05/sony-ps5-playstation-5.jpg.webp",
    ),
    Product(
      "Samsung 55-inch 4K TV",
      800,
      "Samsung 55-inch 4K TV is a high-end TV",
      "https://m.media-amazon.com/images/I/918IlO2KvAL._AC_SX355_.jpg",
    ),
    Product(
      "Bose QuietComfort 35 II",
      300,
      "Bose QuietComfort 35 II is a high-end noise-cancelling headphones",
      "https://boxtechs.com.bd/wp-content/uploads/2022/05/bose-quietcomfort-35-ii-worth-it-4-min.jpeg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return productDetails(product);
              }));
            },
            child: Container(
              width: 250,
              height: 250, // Set a fixed height for the card
              child: Card(
                margin: EdgeInsets.only(bottom: 20.0),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: Color.fromARGB(31, 96, 99, 100)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        "${product.productImage}",
                        width: 100.0,
                        height: 100.0,
                      ),
                      Text("Product Name: ${product.productName}"),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text("Price: ${product.price}"),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text("Description: ${product.description}"),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
