import 'package:counter_7/pages/show_desc.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/pages/form.dart';
import 'package:counter_7/pages/show.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/models.dart';

class MyWatchPage extends StatefulWidget {
  const MyWatchPage({super.key});

  @override
  State<MyWatchPage> createState() => _MyWatchPageState();
}

class _MyWatchPageState extends State<MyWatchPage> {
  Future<List<ToDo>> fetchToDo() async {
    var url =
        Uri.parse('https://katalog-lab-rakan.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object ToDo
    List<ToDo> listToDo = [];
    for (var d in data) {
      if (d != null) {
        listToDo.add(ToDo.fromJson(d));
      }
    }

    return listToDo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Watch List'),
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
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage()),
                    );
                  },
                ),
                ListTile(
                  title: Text('Tambah Budget'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyFormPage()),
                    );
                  },
                ),
                ListTile(
                  title: Text('Data Budget'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyShowPage()),
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
        body: FutureBuilder(
            future: fetchToDo(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada to do list :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyDetailPage(
                                        modelWatchList:
                                            snapshot.data![index].fields)),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: snapshot.data![index].fields.watched
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                  borderRadius: BorderRadius.circular(15.0),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black, blurRadius: 2.0)
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "${snapshot.data![index].fields.title}",
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Checkbox(
                                          value: snapshot
                                              .data![index].fields.watched,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              snapshot.data![index].fields
                                                  .watched = value!;
                                            });
                                          }),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ));
                }
              }
            }));
  }
}
