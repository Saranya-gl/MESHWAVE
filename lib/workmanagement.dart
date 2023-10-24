import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/scrollable_Widget.dart';
import 'package:flutter_application_1/widget/text_dialog_widget.dart';

class EditablePage extends StatefulWidget {
  @override
  _EditablePageState createState() => _EditablePageState();
}

class _EditablePageState extends State<EditablePage> {
  List<WorkItem> workItems = [];
  List<WorkItem> filteredItems = [];

  @override
  void initState() {
    super.initState();

    // Initialize workItems with some initial data or load data from a source
    workItems = [
      WorkItem(
        date: '2023-10-05',
        work: 'Task 1',
        amount: 100.00,
        paymentStatus: 'Paid',
        progress: '50%',
        inCharge: 'John Doe',
      ),
      WorkItem(
        date: '2023-10-06',
        work: 'Task 2',
        amount: 150.00,
        paymentStatus: 'Not Paid',
        progress: '75%',
        inCharge: 'Alice Smith',
      ),
    ];

    // Initialize filteredItems with all work items initially
    filteredItems = List.of(workItems);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Work Management'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                addWorkItem();
              },
            ),
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {
                showFilterDialog();
              },
            ),
          ],
        ),
        body: ScrollableWidget(child: buildDataTable()),
      );

  Widget buildDataTable() {
    final columns = ['Date', 'Work', 'Amount', 'Payment Status', 'Progress', 'In Charge', 'Actions'];

    return DataTable(
      columns: getColumns(columns),
      rows: getRows(filteredItems),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      final isNumeric = column == 'Amount';
      return DataColumn(
        label: Text(column),
        numeric: isNumeric,
      );
    }).toList();
  }

  List<DataRow> getRows(List<WorkItem> workItems) => workItems.map((WorkItem workItem) {
    final cells = [
      workItem.date,
      workItem.work,
      workItem.amount.toString(),
      workItem.paymentStatus,
      workItem.progress,
      workItem.inCharge,
    ];

    return DataRow(
      cells: cells.asMap().entries.map((entry) {
        final index = entry.key;
        final cell = entry.value;
        final showEditIcon = index != 2; // Allow editing all fields except 'Amount'

        return DataCell(
          Text('$cell'),
          showEditIcon: showEditIcon,
          onTap: () {
            if (showEditIcon) {
              editWorkItem(workItem, index);
            }
          },
        );
      }).toList() +
      [
        DataCell(
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              deleteWorkItem(workItem);
            },
          ),
        ),
      ],
    );
  }).toList();

  Future editWorkItem(WorkItem editWorkItem, int fieldIndex) async {
    final fieldName = ['Date', 'Work', 'Payment Status', 'Progress', 'In Charge'][fieldIndex];
    final fieldValue = fieldIndex == 2 ? editWorkItem.amount.toString() : editWorkItem.getFieldValue(fieldIndex);

    final newValue = await showTextDialog(
      context,
      title: 'Change $fieldName',
      value: fieldValue,
    );

    setState(() {
      workItems = workItems.map((workItem) {
        if (workItem == editWorkItem) {
          if (fieldIndex == 2) {
            workItem.amount = double.tryParse(newValue) ?? 0.00;
          } else {
            workItem.setFieldValue(fieldIndex, newValue);
          }
        }
        return workItem;
      }).toList();
    });
  }

  void deleteWorkItem(WorkItem workItem) {
    setState(() {
      workItems.remove(workItem);
      filteredItems.remove(workItem); // Update filteredItems
    });
  }

  void addWorkItem() async {
    final newWorkItem = WorkItem(
      date: 'New Date',
      work: 'New Work',
      amount: 0.00,
      paymentStatus: 'Not Paid',
      progress: '0%',
      inCharge: 'New In Charge',
    );

    setState(() {
      workItems.add(newWorkItem);
      filteredItems.add(newWorkItem); // Update filteredItems
    });
  }

  void showFilterDialog() async {
    final result = await showDialog(
      context: context,
      builder: (context) => FilterDialog(workItems),
    );

    if (result != null) {
      setState(() {
        filteredItems = List.from(result);
      });
    }
  }
}

class WorkItem {
  String date;
  String work;
  double amount;
  String paymentStatus;
  String progress;
  String inCharge;

  WorkItem({
    required this.date,
    required this.work,
    required this.amount,
    required this.paymentStatus,
    required this.progress,
    required this.inCharge,
  });

  String getFieldValue(int fieldIndex) {
    switch (fieldIndex) {
      case 0:
        return date;
      case 1:
        return work;
      case 2:
        return amount.toString();
      case 3:
        return paymentStatus;
      case 4:
        return progress;
      case 5:
        return inCharge;
      default:
        return '';
    }
  }

  void setFieldValue(int fieldIndex, String value) {
    switch (fieldIndex) {
      case 0:
        date = value;
        break;
      case 1:
        work = value;
        break;
      case 2:
        amount = double.tryParse(value) ?? 0.00;
        break;
      case 3:
        paymentStatus = value;
        break;
      case 4:
        progress = value;
        break;
      case 5:
        inCharge = value;
        break;
    }
  }
}

class FilterDialog extends StatefulWidget {
  final List<WorkItem> allWorkItems;

  FilterDialog(this.allWorkItems);

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  List<WorkItem> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = List.of(widget.allWorkItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Filter Work Items'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('Paid Work Items'),
            onTap: () {
              filterWorkItemsByPaymentStatus('Paid');
            },
          ),
          ListTile(
            title: Text('Not Paid Work Items'),
            onTap: () {
              filterWorkItemsByPaymentStatus('Not Paid');
            },
          ),
          ListTile(
            title: Text('Reset Filter'),
            onTap: () {
              resetFilter();
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(filteredItems);
          },
          child: Text('Apply Filter'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }

  void filterWorkItemsByPaymentStatus(String status) {
    setState(() {
      filteredItems = widget.allWorkItems.where((workItem) => workItem.paymentStatus == status).toList();
    });
  }

  void resetFilter() {
    setState(() {
      filteredItems = List.of(widget.allWorkItems);
    });
  }
}

