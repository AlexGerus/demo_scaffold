import 'dart:io';

import 'package:demo_scaffold/models/result.dart';
import 'package:demo_scaffold/models/trending-response-model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return !Platform.isIOS ? const CupertinoHomeApp() : const MaterialHomeApp();
  }
}

class MaterialHomeApp extends StatefulWidget {
  const MaterialHomeApp({
    super.key,
  });

  @override
  State<MaterialHomeApp> createState() => _MaterialHomeAppState();
}

class _MaterialHomeAppState extends State<MaterialHomeApp> {
  int _tabIndex = 0;
  int _count = 0;
  String baseUrl = "https://api.themoviedb.org/3";
  String trendingEndpoint = "/trending/movie/day";
  String apiKey = "00bb58c23faa32646daf84c1250aa9ec";

  Future<TrendingResponseModel> getTrendingMovies() async {
    String url = "$baseUrl$trendingEndpoint?language=en-US&&api_key=$apiKey";
    var response = await http.get(Uri.parse(url));
    final trendingMovieModel = trendingResponseModelFromJson(response.body);
    return trendingMovieModel;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Column(
            children: [
              Text(
                "Good Morning",
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text("Dashboard"),
              )
            ],
          ),
          toolbarHeight: 100,
          leading: IconButton(
            icon: const Icon(Icons.account_circle, size: 70),
            onPressed: () {},
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => setState(() {
            _count++;
          }),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _tabIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
            BottomNavigationBarItem(
                icon: Icon(Icons.info_outline), label: "About"),
          ],
          onTap: (int index) => setState(
            () {
              _tabIndex = index;
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              OutlinedButton(onPressed: () {}, child: const Text("Contacts")),
              OutlinedButton(
                  onPressed: () {}, child: const Text("Notifications")),
              OutlinedButton(onPressed: () {}, child: const Text("Reports")),
              Text("You pressed on button $_count times."),
              SizedBox(
                height: 10,
              ),
              FutureBuilder(
                  future: getTrendingMovies(),
                  builder: (context, snapshot) {
                    print('Connection state: ${snapshot.connectionState}');
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(); // Display a loader while waiting
                    } else if (snapshot.hasError) {
                      print('Error: ${snapshot.error}');
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData) {
                      print('No data yet...');
                      return Text('No data yet...');
                      // Alternatively, you can return an empty container or another widget
                    } else {
                      print('Fetched Data: ${snapshot.data}');
                      List<Result> movies = snapshot.data?.results ?? [];

                      return Expanded(
                        child: OverflowBox(
                          maxWidth: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            itemCount: movies.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  movies[index].original_title ?? 'No Title',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                    movies[index].overview ?? 'No Overview'),
                              );
                            },
                          ),
                        ),
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class CupertinoHomeApp extends StatefulWidget {
  const CupertinoHomeApp({
    super.key,
  });

  @override
  State<CupertinoHomeApp> createState() => _CupertinoHomeAppState();
}

class _CupertinoHomeAppState extends State<CupertinoHomeApp> {
  int _count = 0;
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: const CupertinoThemeData(brightness: Brightness.light),
        home: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              currentIndex: _tabIndex,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.settings), label: "Settings"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.info), label: "About"),
              ],
              onTap: (int index) => setState(() {
                _tabIndex = index;
              }),
            ),
            tabBuilder: (BuildContext context, int index) => CupertinoTabView(
                  builder: (BuildContext context) {
                    return const CupertinoPageScaffold(
                        navigationBar:
                            CupertinoNavigationBar(middle: Text("Demo Screen")),
                        child: Center());
                  },
                )));
  }
}
