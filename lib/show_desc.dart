import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/show.dart';
import 'package:counter_7/models.dart';
import 'package:counter_7/watch.dart';

class MyDetailPage extends StatefulWidget {
  const MyDetailPage({super.key, required this.modelWatchList});
  final Fields modelWatchList;

  @override
  State<MyDetailPage> createState() => _MyDetailPageState(modelWatchList);
}

class _MyDetailPageState extends State<MyDetailPage> {
  Fields model;
  _MyDetailPageState(this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
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
              ListTile(
                title: Text('My Watch List'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyWatchPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  model.title,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Release Date: ${DateFormat.yMMMd().format(model.releaseDate)}",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Rating : ${model.rating.toString()} / 5",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "Status: ${model.watched ? "Watched" : "Not watched"}"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Review : \n\n${model.review}",
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyWatchPage()),
                        );
                      },
                      style: TextButton.styleFrom(
                          backgroundColor:
                              Colors.blue,
                          minimumSize: const Size.fromHeight(40.0),
                      ),
                      child: const Text(
                        "Back",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
