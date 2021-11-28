import 'package:flutter/material.dart';
import 'package:natraj/screen/home_page.dart';
import 'package:natraj/service/api_service.dart';

class Loginscreen extends StatelessWidget {

  TextEditingController namecontroller=TextEditingController(text: "PratapAwachar");
  TextEditingController passwordController=TextEditingController(text: "77210");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Natraj Packging"),
        centerTitle: true,
        backgroundColor:Colors.redAccent,

      ),
      body:Container(
        margin: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: namecontroller,
              decoration: InputDecoration(
                labelText: "username",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height:30),

            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height:30),

            Container(
              height:50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(onPressed: ()async{
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));
              //  final getToken= await Apiservice().userLogin(namecontroller.text, passwordController.text);
              //  if (getToken['token'] != null){
              //    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("success ! your token id is ${getToken['token']}"),backgroundColor: Colors.green,));
              //    Future.delayed(Duration(seconds:2),(){
              //      Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>HomePage()));
              //    });}
              //  else{
              //    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("userName or passsword incorrect"),backgroundColor: Colors.green,));

              //  }

              }, child:Text("Login ",style:TextStyle(
                fontSize: 25,fontWeight: FontWeight.bold
              ),)),
              
              
              )
            

            

          ],
        ),
        ),
      );
      
    ;
  }
}