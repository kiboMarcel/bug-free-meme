import 'package:flutter/material.dart';

import 'widgets/list_child.dart';

class CostommScroolView extends StatefulWidget {
  CostommScroolView({Key? key}) : super(key: key);

  @override
  State<CostommScroolView> createState() => _CostommScroolViewState();
}

class _CostommScroolViewState extends State<CostommScroolView> {
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    /*  scrollController.addListener(() {
      print(scrollController.offset);
    }); */
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        cacheExtent: 0,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            floating: true,
            pinned: true,
            expandedHeight: 200,
            backgroundColor: Color(0xFF1F868D),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Hello'),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              for (var i = 0; i < 20; i++) Child(),
            ]),
          ),
        ],
      ),
    );
  }
}
