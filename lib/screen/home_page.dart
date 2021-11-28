import 'package:flutter/material.dart';
import 'package:natraj/screen/all_category.dart';

import 'package:natraj/screen/product_detail.dart';
import 'package:natraj/service/api_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Natraj Packging"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.redAccent,
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder:(context)=>Allcategory()) );

            },icon: Icon(Icons.view_list)),
        
          
            // IconButton(onPressed: (){
            //   Navigator.push(context,MaterialPageRoute(builder:(context)=>CartScreen()) );

            // },icon: Icon(Icons.shopping_cart))
          ],
        ),
        body: FutureBuilder(
            future: Apiservice().getAllposts(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data[index]['title']),
                          leading: Image.network(
                            snapshot.data[index]['image'],
                            height: 50,
                            width: 30,
                          ),
                          subtitle: Text("Price-\$" +
                              snapshot.data[index]['price'].toString()),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetail(
                                        snapshot.data[index]['id'])));
                          },
                        );
                      }),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
