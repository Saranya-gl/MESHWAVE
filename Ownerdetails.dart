import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: InputPage(),
    ),
  );
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  TextEditingController textController3 = TextEditingController();
  TextEditingController textController4 = TextEditingController();

  String input1 = '';
  String input2 = '';
  String input3 = '';
  String input4 = '';

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    textController3.dispose();
    textController4.dispose();
    super.dispose();
  }

  void _setValues() {
    setState(() {
      input1 = textController1.text;
      input2 = textController2.text;
      input3 = textController3.text;
      input4 = textController4.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Owner Details',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF20485A),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Owner Details',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xFF20485A),
              ),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: [
                  ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 100,
                            child: Text(
                              'Name: ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF20485A),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: textController1,
                            onChanged: (value) {
                              setState(() {
                                input1 = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 100,
                            child: Text(
                              'Phone Number: ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF20485A),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: textController2,
                            onChanged: (value) {
                              setState(() {
                                input2 = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 100,
                            child: Text(
                              'Share Percentage: ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF20485A),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: textController3,
                            onChanged: (value) {
                              setState(() {
                                input3 = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 100,
                            child: Text(
                              'Investment: ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF20485A),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: textController4,
                            onChanged: (value) {
                              setState(() {
                                input4 = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title:Row(children: [ElevatedButton(
              onPressed: _setValues,style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),backgroundColor: Color(0xFF20485A), padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),maximumSize: Size(100, 40)),
              
              child: Text('Add More',style: 
              TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white),),
               // Button to set text field values
            ),],)  
                  )
                ],
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
