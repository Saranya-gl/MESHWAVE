import 'package:fishbook/chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _yearController = TextEditingController();
  List<String> months = [];
  List<int> rev = [];
  List<int> exp = [];
  List<int> prof = [];

  Future<Map<String, dynamic>> fetchData(int year) async {
    final url = Uri.parse('http://127.0.0.1:5000/api/data?year=$year');
    

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return data;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 200,
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _yearController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Year',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Fetch data using the entered year
                String enteredYear = _yearController.text.trim();
                if (enteredYear.isNotEmpty && int.tryParse(enteredYear) != null) {
                  fetchData(int.parse(enteredYear))
                      .then((data) {
                        setState(() {
                          // Update the state variables
                          months = List<String>.from(data['month']);
                          rev = List<int>.from(data['rev']);
                          exp = List<int>.from(data['exp']);
                          prof = List<int>.from(data['prof']);
                        });
                        print('Fetched data: $data');
                      })
                      .catchError((error) {
                        // Handle errors
                        print('Error fetching data: $error');
                      });
                } else {
                  // Handle invalid input
                  print('Invalid year input');
                }
              },
              child: Text('Submit'),
            ),
            FutureBuilder<Map<String, dynamic>>(
              future: fetchData(int.tryParse(_yearController.text) ?? 0),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: [
                          DataColumn(label: Text('Month')),
                          DataColumn(label: Text('Revenue')),
                          DataColumn(label: Text('Expense')),
                          DataColumn(label: Text('Profit')),
                        ],
                        rows: List<DataRow>.generate(
                          months.length,
                          (index) => DataRow(
                            cells: [
                              DataCell(Text(months[index])),
                              DataCell(Text(rev[index].toString())),
                              DataCell(Text(exp[index].toString())),
                              DataCell(Text(prof[index].toString())),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the other page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Chart()),
                  );
                },
                child: Text('Chart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
