


import 'dart:convert';
//import 'dart:html';

import 'package:http/http.dart' as http;


class Apiservice{
 Future getAllposts()async{
   final allproductUrl=Uri.parse("https://fakestoreapi.com/products");
   final response= await http.get(allproductUrl);
   //print(response.statusCode);
  // print(response.body);
   return json.decode(response.body);  
   
   }

   
 Future getsingleProduct(int id)async{
   final singleProducturl=Uri.parse("https://fakestoreapi.com/products/$id");
   final response=await http.get(singleProducturl);
   print(response.statusCode);
   print(response.body);
   return json.decode(response.body);  
   
   }

   Future getAllCategory()async{
   final allCategory=Uri.parse("https://fakestoreapi.com/products/categories");
   final response=await http.get(allCategory);
   print(response.statusCode);
   print(response.body);
   return json.decode(response.body);  
   
   }

   Future getProductByCategory(String catName)async{
   final fetchProductCategoryurl=Uri.parse("https://fakestoreapi.com/products/category/$catName");
   final response=await http.get(fetchProductCategoryurl);
   print(response.statusCode);
   print(response.body);
   return json.decode(response.body);  
   
   }

 Future getcart(String userId)async{
   final fetchcartProducts=Uri.parse("https://fakestoreapi.com/products/category/$userId");
   final response=await http.get(fetchcartProducts);
   print(response.statusCode);
   print(response.body);
   return json.decode(response.body);  
   
   }

//post request
   Future userLogin(String username, String password)async{
     final loginUrl= await Uri.parse("https://fakestoreapi.com/auth/login");
     final response = http.post(loginUrl,body:{
     'username':username,
     'password':password,
     


     });
  //  print(response.statusCode);
  //  print(response.body);
  //  return json.decode(response.body);
   
   }

}