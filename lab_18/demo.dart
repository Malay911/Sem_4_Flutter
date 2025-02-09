import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'database.dart';

void main() {
  runApp(Demo());
}

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  MyDatabase database = MyDatabase();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Lab_18')),
          body: FutureBuilder(
            future: database.selectAllState(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data![index]["state_name"]),
                      trailing: Container(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () async {
                                await database.deleteState(
                                    snapshot.data![index]["state_id"]);
                                setState(() {});
                              },
                              icon: Icon(Icons.delete),
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    TextEditingController state =
                                    TextEditingController(
                                        text: snapshot.data![index]
                                        ["state_name"]);
                                    return AlertDialog(
                                      title: Text("Edit"),
                                      content: TextField(
                                        controller: state,
                                      ),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () async {
                                              await database.updateState({
                                                "state_id": snapshot
                                                    .data![index]["state_id"],
                                                "state_name": state.text
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Edit"))
                                      ],
                                    );
                                  },
                                ).then(
                                      (value) {
                                    setState(() {});
                                  },
                                );
                              },
                              icon: Icon(Icons.edit),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(child: Text("Error"));
              }
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  TextEditingController state = TextEditingController();
                  return AlertDialog(
                    title: Text("Add"),
                    content: TextField(
                      controller: state,
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () async {
                            await database.insertState({"state_name": state.text});
                            Navigator.of(context).pop();
                          },
                          child: Text("Submit"))
                    ],
                  );
                },
              ).then((value) {
                setState(() {});
              });
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
