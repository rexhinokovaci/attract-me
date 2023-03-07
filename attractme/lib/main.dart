import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guides and Attractions of Albania',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BuyTicketsPage(),
    );
  }
}

class BuyTicketsPage extends StatefulWidget {
  @override
  _BuyTicketsPageState createState() => _BuyTicketsPageState();
}

class _BuyTicketsPageState extends State<BuyTicketsPage> {
  final _formKey = GlobalKey<FormState>();
  String _name;
  String _email;
  DateTime _date;
  String _ticketType;
  int _ticketQuantity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Tickets'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  // TODO: Add email validation
                  return null;
                },
                onSaved: (value) {
                  _email = value;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Date',
                ),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please select a date';
                  }
                  // TODO: Add date validation
                  return null;
                },
                onSaved: (value) {
                  _date = DateTime.parse(value);
                },
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: 'Ticket Type',
                ),
                value: _ticketType,
                items: [
                  DropdownMenuItem(
                    value: 'adult',
                    child: Text('Adult'),
                  ),
                  DropdownMenuItem(
                    value: 'child',
                    child: Text('Child'),
                  ),
                ],
                validator: (value) {
                  if (value == null) {
                    return 'Please select a ticket type';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _ticketType = value;
                  });
                },
                onSaved: (value) {
                  _ticketType = value;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Ticket Quantity',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the number of tickets';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _ticketQuantity = int.parse(value);
                },
              ),
              SizedBox(height: 16
