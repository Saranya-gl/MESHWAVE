import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(CrewMember());
}

class CrewMember extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      
      home: CrewDet(),
      
    );
  }
}

class CrewDet extends StatefulWidget {
  @override
  _CrewDet createState() => _CrewDet();
}

class _CrewDet extends State<CrewDet> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingControlle3 = TextEditingController();
  String name="";
  int Boatno=0;
  int phonenum =0;
  String email="";
  String errorText1='';
  String errorText2='';
  String errorText='';
  String errorText3='';


  

  @override
  void dispose() {
    textEditingController.dispose();
    textEditingController1.dispose();
    textEditingController2.dispose();
    textEditingControlle3.dispose();
    super.dispose();
  }
  void _setValues(){

    setState(() {
      Boatno=int.parse(textEditingController.text);
      phonenum=int.parse(textEditingController1.text);
      name=textEditingController1.text;
   
      email=textEditingControlle3.text;

    });





  } bool isAlphabetic(String input) {
    for (int i = 0; i < input.length; i++) {
    if (!input[i].contains(RegExp(r'[a-zA-Z]'))) {
      return false;
    }
  }
  return true;
  }
 bool isValidEmai(String email){
    final Emailreg=RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
 
 return Emailreg.hasMatch(email); }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Crew Member Details ",style:TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)
            ,
             Container(
  width: 500,
  child: TextField(
    controller: textEditingController2,
    keyboardType: TextInputType.name,
   
    decoration: InputDecoration(
      labelText: "Name",
      labelStyle: TextStyle(color: Color(0xFF20485A)),
     errorText: errorText3,
    errorStyle: TextStyle(
      color: Colors.black, // Customize the error text color
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black), // Customize the error underline color
    ),
      icon: Icon(Icons.person),
     
    ),
  ),
),
            Container(
  width: 500,
  child: TextField(
    controller: textEditingController,
    keyboardType: TextInputType.number,
    inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.digitsOnly
    ],
    decoration: InputDecoration(
      labelText: "Boat No.",
      labelStyle: TextStyle(color: Color(0xFF20485A)),
      errorText: errorText,
    errorStyle: TextStyle(
      color: Colors.black, // Customize the error text color
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black), // Customize the error underline color
    ),
      icon: Icon(Icons.directions_boat),
     
    ),
  ),
),
          
          Container( 
  width: 500,
  child: TextField(
    controller: textEditingController1,
    keyboardType: TextInputType.phone,
    inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.digitsOnly
    ],
    decoration: InputDecoration(
      labelText: "Phone Number",
      labelStyle: TextStyle(color: Color(0xFF20485A)),
      errorText: errorText1,
    errorStyle: TextStyle(
      color: Colors.black, // Customize the error text color
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black), // Customize the error underline color
    ),
      icon: Icon(Icons.phone),
     
    ),
  ),
),
            Container(
              width: 500,
              child: TextField(
                controller: textEditingControlle3,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
               
                labelText: "Email Address",
                  labelStyle: TextStyle(color: Color(0xFF20485A)),
                  errorText: errorText2,
    errorStyle: TextStyle(
      color: Colors.black, // Customize the error text color
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black), // Customize the error underline color
    ),
                  icon: Icon(Icons.email)
                ),
               
              ),
              

            ),
            ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF20485A)),padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(16.0))),onPressed: (){
                
            
                int userInt =int.parse(textEditingController1.text);
                int userBn =int.parse(textEditingController.text);
                String eml = textEditingControlle3.text;
                if(isValidEmai(eml)){
                  setState(() {
                    errorText2='';
                    email=eml;
                    textEditingControlle3.text='';
                  });
                }
                else{
                  setState(() {
                    errorText2='Invalid Email Address';
                  });
                }
                
                setState(() {
                  String name_=textEditingController2.text;
                  String ns=userInt.toString();
                  String nb=userBn.toString();
                  if(isAlphabetic(name)){
                    name=name_;
                    errorText3="";
                    textEditingController2.text='';

                  }
                  else{
                    errorText3="Invalid name";
                  }
                  
                  if((nb.length)==5){
                    Boatno=userBn;
                    errorText="";
                    textEditingController.text='';
                  }
                  else{
                    errorText="Invalid Boat number";
                  }

                  if ((ns.length)==10) {
                      phonenum=userInt;
                      errorText1="";
                      textEditingController1.text='';
                    
                  }else{
                    errorText1 ="Invalid Phone Number";
                  }

                  
                },
               
                );
             
             
              
                
            }, child: Text('ADD ',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),))
            
              ,
              ],
            ),
        
        ),
      );
 
   
  }
}
