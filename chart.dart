import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() {
  runApp(Chart());
}

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  final TextEditingController textEditingController = TextEditingController();
  String year = '';
  Image? image; 

  Future<void> fetchDataFromServer(String year) async {
    final url = Uri.parse('http://127.0.0.1:5000/get_image?year=$year');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final contentType = response.headers['content-type'];
        if (contentType == 'image/png') {
          final bodyBytes = response.bodyBytes;
          final imageWidget = Image.memory(bodyBytes);
          setState(() {
            image = imageWidget;
          });
        }
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(width:100,
                child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    labelText: 'Enter Year',
                  ),
                  onChanged: (value) {
                    year = value;
                  },
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  fetchDataFromServer(year); 
                },
                child: Text('Submit'),
              ),
              SizedBox(height: 16.0),
              if (image != null) image!, 
              SizedBox(height: 16.0),
             
            ],
          ),
        ),
      ),
    );
  }
}