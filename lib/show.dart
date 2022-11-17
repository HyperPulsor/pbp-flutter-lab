import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/form.dart';

class MyShowPage extends StatefulWidget {
  const MyShowPage({super.key});

  @override
  State<MyShowPage> createState() => _MyShowPageState();
}

class _MyShowPageState extends State<MyShowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Budget'),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              ListTile(
                title: Text('counter_7'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                  );
                },
              ),
              ListTile(
                title: Text('Tambah Budget'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyFormPage()),
                  );
                },
              ),
              ListTile(
                title: Text('Data Budget'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyShowPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: Budget.budgets.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        child: Text(Budget.budgets[index].budgetJudul),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(Budget.budgets[index].budgetNominal.toString()),
                            Text(Budget.budgets[index].budgetJenis),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
        ),
      )
    );
  }
}

