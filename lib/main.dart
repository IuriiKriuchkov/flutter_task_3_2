import 'dart:async';
import 'package:flutter/material.dart';
import 'widgets/card_view.dart';
import 'json_module/json_fetch_data.dart';
import 'json_module/post.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Post>> futurePost;
  late List<Post> characterList;

  @override
  void initState() {
    futurePost = fetchPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Posts from server response',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Best posts'),
        ),
        body: Center(
          child: FutureBuilder<List<Post>>(
            future: futurePost,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var serverData = snapshot.data!;
                return ListView.builder(
                    itemCount: serverData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CardView(serverData: serverData, index: index),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
