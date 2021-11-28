 //import 'dart:js';

// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:natraj/service/api_service.dart';

class ProductDetail extends StatelessWidget {
  final int id;
  const ProductDetail(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
        ),
        body: FutureBuilder(
          future: Apiservice().getsingleProduct(id),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30,),
                      Image.network(snapshot.data['image'],height: 200, width: double.infinity,),
                      SizedBox(height: 10,),
                      Center(
                        child: Text( "\$" + snapshot.data['price'].toString(),style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(snapshot.data['title'],style: TextStyle(
                        fontSize: 25
                      ),),
              
                      Chip(label: Text(snapshot.data['category'].toString(),style: TextStyle(
                        fontSize: 15,
                        color:Colors.white
                      ),),backgroundColor: Colors.blueGrey,),
                      SizedBox(height: 30,),
                      Text(snapshot.data['description']),
              
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child:Icon(Icons.add_shopping_cart_outlined),
          onPressed: (){},
          backgroundColor: Colors.green,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        
        
        
        );
  }
}
