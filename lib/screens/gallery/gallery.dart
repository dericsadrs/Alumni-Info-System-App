import 'dart:convert';

import 'package:alumni_sandbox/back_end/galleryList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  late Future<List<GalleryList>> galleryFuture = getGallery();

  @override
  void initState() {
    super.initState();
    galleryFuture = getGallery();
  }

  static Future<List<GalleryList>> getGallery() async {
    const url = 'https://10.0.2.2/backend_app/gallery/getGallery.php';
    final response = await http.get(Uri.parse(url));
    final body = jsonDecode(response.body);
    return body.map<GalleryList>(GalleryList.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<List<GalleryList>>(
          future: galleryFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              final pictures = snapshot.data!;

              return buildview(pictures);
            } else {
              return const Text("No User Data");
            }
          },
        ),
      ),
    );
  }

  Widget buildview(List<GalleryList> pictures) => GridView.builder(
      itemCount: pictures.length,
      itemBuilder: (context, index) {
        final picture = pictures[index];

        return Container(
            padding: EdgeInsets.all(5),
            child: FittedBox(
              child: Image.asset(picture.image_path),
              fit: BoxFit.fill,
            ));
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ));
}