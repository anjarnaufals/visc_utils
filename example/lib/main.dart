import 'package:flutter/material.dart';
import 'package:visc_utils/visc_utils.dart';

import 'feat/fluent_2_layout_widget_example.dart';
import 'feat/material_3_layout_widget_example.dart';
import 'feat/responsive_font_size_example.dart';
import 'feat/responsive_margin_example.dart';

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

class ExampleWidget extends StatefulWidget {
  const ExampleWidget({super.key});

  @override
  State<ExampleWidget> createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  ValueNotifier<MarginRule> marginRule =
      ValueNotifier(MarginRule.marginOptimal);

  void switchMarginRule() {
    if (marginRule.value.isMarginOptimal()) {
      marginRule.value = MarginRule.marginM3;
    } else {
      marginRule.value = MarginRule.marginOptimal;
    }
  }

  @override
  void dispose() {
    marginRule.dispose();
    super.dispose();
  }

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
          SliverToBoxAdapter(
            child: ListenableBuilder(
              listenable: marginRule,
              builder: (_, __) => Padding(
                padding: viscAllMargin(
                  context,
                  marginRule: marginRule.value,
                ),
                child: Builder(builder: (_) {
                  double width = MediaQuery.of(context).size.width;
                  return Text(
                    "Width : ${width}px",
                    style: ViscTypo.headlineSmall(context),
                  );
                }),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Fluent2LayoutWidgetExample(),
          ),
          const SliverToBoxAdapter(
            child: Material3LayoutWidgetExample(),
          ),
          SliverPadding(
            padding: viscHorizontalMargin(context),
            sliver: SliverList.list(
              children: [
                ResponsiveMarginExample(
                  marginRule: marginRule,
                  switchMarginRule: switchMarginRule,
                ),
                const Divider(),
                const ResponsiveFontSizeExample(),
                const SizedBox(height: kToolbarHeight),
              ],
            ),
          ),
          SliverPadding(
            padding: viscHorizontalMargin(context),
            sliver: ListenableBuilder(
              listenable: marginRule,
              builder: (_, __) => SliverGrid.builder(
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 4 / 5,
                  crossAxisSpacing: marginRule.value.isMarginM3()
                      ? baseMarginM3(context)
                      : baseMarginOptimal(context),
                  mainAxisSpacing: marginRule.value.isMarginM3()
                      ? baseMarginM3(context)
                      : baseMarginOptimal(context),
                ),
                itemBuilder: (_, index) {
                  return ListenableBuilder(
                    listenable: marginRule,
                    builder: (_, __) => Container(
                      padding:
                          viscAllMargin(context, marginRule: marginRule.value),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Image.network(
                        'https://picsum.photos/300/300',
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
