import 'package:flutter/material.dart';
import 'package:flutter_beginner_class/24_01_04/img_search/view_model/main_view_model.dart';
import 'package:flutter_beginner_class/24_01_04/img_search/view_model/result/main_event.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<MainViewModel>().eventStream.listen((event) {
        switch (event) {
          case GetSnackBar():
            final snackBar = SnackBar(
              content: Text(event.data),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          case GetDiaLog():
            showDialog(
              context: context,
              barrierDismissible: true, //바깥 영역 터치시 닫을지 여부 결정
              builder: ((context) {
                return AlertDialog(
                  title: Text(event.data),
                  actions: <Widget>[
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(); //창 닫기
                        },
                        child: Text("닫기"),
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
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          viewModel.updateImg(controller.text);
                        },
                      )),
                ),
              ),
            ],
          ),
          viewModel.mainState.isLoding
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: viewModel.mainState.imgList.map((e) {
                      return Image.network(e.previewURL);
                    }).toList(),
                  ),
                ),
        ],
      )),
    );
  }
}
