import 'package:flutter/material.dart';
import 'package:flutter_beginner_class/23_12_28/exam1/repository/photo_repository.dart';

class PhotoMain extends StatefulWidget {
  int _albumId;

  PhotoMain({super.key, required albumId}) : _albumId = albumId;

  @override
  State<PhotoMain> createState() => _PhotoMainState();
}

class _PhotoMainState extends State<PhotoMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[100],
      ),
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder(
              future: PhotoRepository().getAlbumList(widget._albumId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Expanded(
                    child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 30,
                        crossAxisCount: 2,
                        children: snapshot.data!
                            .map((e) => TextButton(
                                  onPressed: () {},
                                  child: Column(
                                    children: [
                                      Image.network(e.thumbnailUrl),
                                      Text('${e.albumId} & ${e.title}')
                                    ],
                                  ),
                                ))
                            .toList()),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
