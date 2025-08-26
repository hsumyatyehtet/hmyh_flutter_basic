
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args){
  runApp(MaterialApp(home: SliverAppBarSample(),));
}

class SliverAppBarSample extends StatelessWidget {
  const SliverAppBarSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
          length: 3,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: const Text('Basic Sliver'),

                // Height when expanded
                expandedHeight: 200,

                // Floating: AppBar appears as soon as you scroll up
                floating: true,

                // Pinned: AppBar remains visible when collapsed
                pinned: true,

                // Snap: AppBar snaps open/closed when floating
                snap: true,

                // Stretch: Allows over-scroll stretching
                stretch: true,

                // Flexible space bar for expanded content
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.blue,Colors.purple]
                      ),
                    ),
                    child: const SafeArea(
                        child: Center(
                          child: Text(
                            'Flexible Space',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        )
                    ),
                  ),
                ),

                // Bottom widget (like TabBar)
                bottom: TabBar(
                    tabs:[
                      Tab(
                        text: 'Tab1'
                      ),
                      Tab(text: 'Tab2',),
                      Tab(text: 'Tab3',),
                    ],
                ),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate((context,index){
                    return ListTile(
                      title: Text('Item $index'),
                      subtitle: Text('Subtitle for item $index'),
                    );
                  },childCount: 50),
              ),
            ],
          ),
      ),
    );
  }
}