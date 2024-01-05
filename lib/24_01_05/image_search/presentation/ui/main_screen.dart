import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_beginner_class/24_01_05/image_search/presentation/view_model/main_event.dart';

import 'package:flutter_beginner_class/24_01_05/image_search/presentation/view_model/main_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      StreamSubscription stream = context.read<MainViewModel>().eventStream.listen((event) {
        switch(event) {
          case GetSnackBar() :
            const snackBar = SnackBar(
              content: Text('성공!'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          case GetDiaLog() :
            showDialog(
              context: context,
              barrierDismissible: true, //바깥 영역 터치시 닫을지 여부 결정
              builder: ((context) {
                return AlertDialog(
                  title: const Text("에러 발생"),
                  content: const Text("서버 연결상태가 불안정 합니다."),
                  actions: <Widget>[
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(); //창 닫기
                        },
                        child: const Text("닫기"),
                      ),
                    ),
                  ],
                );
              }),
            );
        }
      });
    });
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('이미지 검색'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                suffixIcon: IconButton(onPressed: () {
                  viewModel.imgSearch(_controller.text);
                }, icon: const Icon(Icons.search))
              ),
            ),
            viewModel.mainState.isLoading
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : Expanded(
                  child: GridView.count(
                                crossAxisCount: 2,
                                children: viewModel.mainState.imgModel.map((e) {
                  return GestureDetector(onTap: () {
                    context.push(
                      '/detail',
                      extra: e
                    );
                  }, child: Image.network(e.previewURL));
                                }).toList(),
                              ),
                )
          ],
        ),
      ),
    );
  }
}
