import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          height: 400,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: Colors.white,
                width: 1.0,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xffdddddd),
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                    fadeOutDuration: const Duration(milliseconds: 250),
                    // Placeholder out
                    fadeInDuration: const Duration(milliseconds: 250),
                    // New image in
                    imageUrl: 'https://placehold.co/600x400/png', // + "xyz",
                    imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover
                            )
                        )
                    ),
                    progressIndicatorBuilder: (context, url, downloadProgress) => Container(
                      alignment: Alignment.center,
                      color: Colors.black.withOpacity(0.1),
                      child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                        backgroundColor: Colors.black.withOpacity(0.2),
                        color: Colors.blue,
                      ),
                    ),
                    errorWidget: (BuildContext context, String str, dynamic args) =>
                        Container(
                          color: Colors.red.withOpacity(0.1),
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                  Icons.warning,
                                  size: 60,
                                  color: Colors.red.withOpacity(0.6)
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Unable to load',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                child: const Text('Check your network and reload your feed', textAlign: TextAlign.center),
                              )
                            ],
                          ),
                        )
                )
            ),
          ),
        )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
