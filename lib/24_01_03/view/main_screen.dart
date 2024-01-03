import 'package:flutter/material.dart';
import 'package:flutter_beginner_class/24_01_03/view_model/main_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<MainViewModel>().getDate();
    });
  }

  @override
  Widget build(BuildContext context) {
    final MainViewModel viewModel = context.watch<MainViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('마스크 재고 있는 곳:'),
        actions: [
          IconButton(
              onPressed: () {
                viewModel.getDate();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: SafeArea(
        child: viewModel.modelData.isData
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children:
                    viewModel.modelData.mask.map((e) => Text(e.name)).toList(),
              ),
      ),
    );
  }
}
