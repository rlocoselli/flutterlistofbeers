import 'package:flutter/material.dart';
import 'beersBO.dart';
import 'beers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Beers>> futureBeers;

  @override
  void initState() {
    super.initState();
    BeersBO bo = BeersBO();
    futureBeers = bo.fetchBeers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Fetch Data Example'),
          ),
          body: Center(
              child: FutureBuilder<List<Beers>>(
                  future: futureBeers,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title:
                                  Text(snapshot.data![index].number.toString()),
                              subtitle: Text(snapshot.data![index].name),
                            );
                          });
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }))),
    );
  }
}
