import 'package:flutter/material.dart';
import 'package:flutter_beginner_class/23_12_28/exam1/repository/album_repository.dart';
import 'package:go_router/go_router.dart';

class AlbumMain extends StatelessWidget {
  const AlbumMain({super.key});

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
              future: AlbumRepository().getAlbumList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Expanded(
                    child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 30,
                        crossAxisCount: 2,
                        children:
                            snapshot.data!.map((e) => TextButton(
                              onPressed: () {
                                context.push(Uri(
                                  path: "/photoList",
                                  queryParameters: {'albumId' : '${e.id}'}
                                ).toString());
                              },
                            child: Text(e.title),)).toList()),
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

/*
Expanded(child: GridView.count(
primary: false,
padding: const EdgeInsets.all(20),
crossAxisSpacing: 30,
mainAxisSpacing: 30,
crossAxisCount: 2,
children: []),
),
*/
