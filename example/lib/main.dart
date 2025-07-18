import 'package:example/feat/responsive_font_size_example_input_size.dart';
import 'package:flutter/material.dart';
import 'package:visc_utils/visc_utils.dart';

import 'feat/fluent_2_layout_widget_example.dart';
import 'feat/material_3_layout_widget_example.dart';
import 'feat/responsive_font_size_example.dart';
import 'feat/responsive_font_size_example_no_width_calculation.dart';
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
    return OrientationLock(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Visc Utils Example',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
          useMaterial3: true,
        ),
        home: const ExampleWidget(),
      ),
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      double screenWidthDp = MediaQuery.of(context).size.width;
      bool isTablet = isDeviceTablet(context, 600);
      ScaffoldMessenger.maybeOf(context)?.showMaterialBanner(
        MaterialBanner(
          backgroundColor: Colors.blueAccent,
          content: Text(
            "width = $screenWidthDp dp, Orientation Should Lock to ${isTablet ? "LANDSCAPE" : "POTRAIT"}",
          ),
          actions: [
            TextButton(
              onPressed: () {
                ScaffoldMessenger.maybeOf(context)?.clearMaterialBanners();
              },
              child: const Text("close"),
            ),
          ],
        ),
      );
    });
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
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MaterialLayoutExample(),
                ),
              );
            },
            child: const Text("to Material Layout Example"),
          )
        ],
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
                const Divider(),
                const ResponsiveFontSizeNoWidthCalculationExample(),
                const Divider(),
                const ResponsiveFontSizeExampleInputSize(),
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

class MaterialLayoutExample extends StatelessWidget {
  const MaterialLayoutExample({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final listCardContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          child: Image.network(
            'https://picsum.photos/640/640',
            height: width * .5,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: viscAllMargin(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Chwaysland Under Bexforth',
                style: ViscTypo.titleLarge(context),
              ),
              const SizedBox(height: 6),
              Text(
                desc,
                style: ViscTypo.bodyMedium(context),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: ActionChip(
                  onPressed: () {},
                  label: const Text('Visit'),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    final gridCardContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.network(
              'https://picsum.photos/640/640',
              fit: BoxFit.fitWidth,
              width: double.infinity,
            ),
          ),
        ),
        Padding(
          padding: viscAllMargin(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Chwaysland Under Bexforth',
                style: ViscTypo.titleLarge(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Text(
                desc,
                style: ViscTypo.bodyMedium(context),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: ActionChip(
                  onPressed: () {},
                  label: const Text('Visit'),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Material Layout ${context.material3Layout.name} Example || ${context.m3LayoutValueOf<BoxFit>(
            compact: BoxFit.contain,
            medium: BoxFit.cover,
            expanded: BoxFit.fill,
            large: BoxFit.fitWidth,
          )}",
          style: ViscTypo.titleLarge(context),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const Fluent2LayoutExample(),
                ),
              );
            },
            child: const Text('To Fluent 2 Layout Example'),
          ),
        ],
      ),
      body: Material3LayoutWidget(
        compact: (context, constraints) => ListView.separated(
          padding: viscAllMargin(context),
          itemCount: 12,
          itemBuilder: (_, __) {
            return Card.filled(
              margin: EdgeInsets.zero,
              child: listCardContent,
            );
          },
          separatorBuilder: (_, __) => SizedBox(
            height: baseMarginOptimal(context),
          ),
        ),
        medium: (context, constraints) => ListView.separated(
          padding: viscAllMargin(context),
          itemCount: 12,
          itemBuilder: (context, index) {
            return Card.filled(
              margin: EdgeInsets.zero,
              child: listCardContent,
            );
          },
          separatorBuilder: (_, __) => SizedBox(
            height: baseMarginOptimal(context),
          ),
        ),
        large: (context, constraints) => GridView.builder(
          padding: viscAllMargin(context),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 4 / 5,
            crossAxisSpacing: baseMarginOptimal(context),
            mainAxisSpacing: baseMarginOptimal(context),
          ),
          itemCount: 12,
          itemBuilder: (context, index) => Card.filled(
            margin: EdgeInsets.zero,
            child: gridCardContent,
          ),
        ),
        extraLarge: (context, constraints) => GridView.builder(
          padding: viscAllMargin(context),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 4 / 5,
            crossAxisSpacing: baseMarginOptimal(context),
            mainAxisSpacing: baseMarginOptimal(context),
          ),
          itemCount: 12,
          itemBuilder: (context, index) => Card.filled(
            margin: EdgeInsets.zero,
            child: gridCardContent,
          ),
        ),
        expanded: (context, constraints) => GridView.builder(
          padding: viscAllMargin(context),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 4 / 5,
            crossAxisSpacing: baseMarginOptimal(context),
            mainAxisSpacing: baseMarginOptimal(context),
          ),
          itemCount: 12,
          itemBuilder: (context, index) => Card.filled(
            margin: EdgeInsets.zero,
            child: gridCardContent,
          ),
        ),
      ),
    );
  }
}

class Fluent2LayoutExample extends StatelessWidget {
  const Fluent2LayoutExample({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final listCardContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          child: Image.network(
            'https://picsum.photos/640/640',
            height: width * .5,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: viscAllMargin(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Chwaysland Under Bexforth',
                style: ViscTypo.titleLarge(context),
              ),
              const SizedBox(height: 6),
              Text(
                desc,
                style: ViscTypo.bodyMedium(context),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: ActionChip(
                  onPressed: () {},
                  label: const Text('Visit'),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    final gridCardContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.network(
              'https://picsum.photos/640/640',
              fit: BoxFit.fitWidth,
              width: double.infinity,
            ),
          ),
        ),
        Padding(
          padding: viscAllMargin(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Chwaysland Under Bexforth',
                style: ViscTypo.titleLarge(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Text(
                desc,
                style: ViscTypo.bodyMedium(context),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: ActionChip(
                  onPressed: () {},
                  label: const Text('Visit'),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fluent 2 Layout ${context.fluent2Layout.name} Example",
          style: ViscTypo.titleLarge(context),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('To Material Layout Example'),
          ),
        ],
      ),
      body: Fluent2LayoutWidget(
        small: (context, constraints) => ListView.separated(
          padding: viscAllMargin(context),
          itemCount: 12,
          itemBuilder: (context, index) {
            return Card.filled(
              margin: EdgeInsets.zero,
              child: listCardContent,
            );
          },
          separatorBuilder: (_, __) => SizedBox(
            height: baseMarginOptimal(context),
          ),
        ),
        medium: (context, constraints) => ListView.separated(
          padding: viscAllMargin(context),
          itemCount: 12,
          itemBuilder: (context, index) {
            return Card.filled(
              margin: EdgeInsets.zero,
              child: listCardContent,
            );
          },
          separatorBuilder: (_, __) => SizedBox(
            height: baseMarginOptimal(context),
          ),
        ),
        large: (context, constraints) => GridView.builder(
          padding: viscAllMargin(context),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 4 / 5,
            crossAxisSpacing: baseMarginOptimal(context),
            mainAxisSpacing: baseMarginOptimal(context),
          ),
          itemCount: 12,
          itemBuilder: (context, index) => Card.filled(
            margin: EdgeInsets.zero,
            child: gridCardContent,
          ),
        ),
        xLarge: (context, constraints) => GridView.builder(
          padding: viscAllMargin(context),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 4 / 5,
            crossAxisSpacing: baseMarginOptimal(context),
            mainAxisSpacing: baseMarginOptimal(context),
          ),
          itemCount: 12,
          itemBuilder: (context, index) => Card.filled(
            margin: EdgeInsets.zero,
            child: gridCardContent,
          ),
        ),
        xxLarge: (context, constraints) => GridView.builder(
          padding: viscAllMargin(context),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 4 / 5,
            crossAxisSpacing: baseMarginOptimal(context),
            mainAxisSpacing: baseMarginOptimal(context),
          ),
          itemCount: 12,
          itemBuilder: (context, index) => Card.filled(
            margin: EdgeInsets.zero,
            child: gridCardContent,
          ),
        ),
        xxxLarge: (context, constraints) => GridView.builder(
          padding: viscAllMargin(context),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 4 / 5,
            crossAxisSpacing: baseMarginOptimal(context),
            mainAxisSpacing: baseMarginOptimal(context),
          ),
          itemCount: 12,
          itemBuilder: (context, index) => Card.filled(
            margin: EdgeInsets.zero,
            child: gridCardContent,
          ),
        ),
      ),
    );
  }
}

const desc =
    '''Established on the Southern side of a mound, the burg of Pernrith is home to vikings lead by Marshal Ady. This burg wasn't built by a mound by accident, as it has rare plants, which is of great importance to the people of Pernrith and its success. 
  The burg itself looks crude. With its dark wooden rooftops, gray walls and vines overgrowing everything, Pernrith has a spine-chilling atmosphere. 
  The main attraction is the fountain, which was built 64 years ago and designed by giants.  Pernrith has a feeble economy, which is mainly supported by war, fletching and blacksmithing. But their biggest strengths are a strong defence and strong magicians.
  However, Pernrith lacks people skilled in cooking. Despite its strengths and weaknesses, Pernrith is most likely headed towards a cheerful future under the leadership of Marshal Ady. But this remains to be seen.
  ''';
