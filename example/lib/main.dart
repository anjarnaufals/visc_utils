import 'package:flutter/material.dart';
import 'package:visc_utils/visc_utils.dart';

import 'feat/fluent_2_layout_widget_example.dart';
import 'feat/material_3_layout_widget_example.dart';
import 'feat/responsive_font_size_example.dart';
import 'feat/responsive_padding_margin_example.dart';

const designWidth = 1280;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Visc Utils Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ExampleWidget(),
    );
  }
}

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Visc Utils Example',
          style: ViscTypo.titleMedium(context),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Fluent2LayoutWidgetExample(),
          ),
          const SliverToBoxAdapter(
            child: Material3LayoutWidgetExample(),
          ),
          SliverPadding(
            padding: viscHorizontalMargin(context),
            sliver: SliverList.list(
              children: const [
                ResponsivePaddingMarginExample(),
                Divider(),
                ResponsiveFontSizeExample(),
                SizedBox(height: kToolbarHeight),
              ],
            ),
          ),
          SliverPadding(
            padding: viscHorizontalMargin(context),
            sliver: SliverGrid.builder(
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 4 / 5,
                crossAxisSpacing: baseMargin(context),
                mainAxisSpacing: baseMargin(context),
              ),
              itemBuilder: (_, index) {
                return Container(
                  padding: viscAllPadding(context),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Flexible(
                        child: Image.network('https://picsum.photos/200/300'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
