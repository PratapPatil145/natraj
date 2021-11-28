//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:natraj/screen/category_product.dart';
import 'package:natraj/service/api_service.dart';


class Allcategory extends StatelessWidget {
  const Allcategory({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(    
      appBar: AppBar(
        title: Text("categories"),
        backgroundColor:Colors.red,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Apiservice().getAllCategory(),
        builder:(context,AsyncSnapshot snapshot){
           if (snapshot.hasData) 
           {
             return ListView.builder(
               itemCount: snapshot.data.length,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryProductScreen(snapshot.data[index])));
                  },
                  child: Card(
                    elevation: 2,
                    margin: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Container(
                      padding: EdgeInsets.all(40),
                      child: Center(
                        child:Text(snapshot.data[index].toString().toUpperCase(),style: TextStyle(fontSize: 30),),
                    ),
                
                  )),
                );
              }
             );

        }
        return Center(
          child: CircularProgressIndicator(),
        );
         
            
          }
        )
      
      
    );
  }
}