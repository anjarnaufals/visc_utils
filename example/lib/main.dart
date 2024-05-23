import 'package:flutter/material.dart';
import 'package:visc_utils/visc_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      body: ListView(
        padding: viscHorizontalMargin(context),
        children: [
          Container(
            color: Colors.purpleAccent.withOpacity(.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lisview use Horizontal Margin',
                  style: ViscTypo.bodyMedium(context),
                ),
                Stack(
                  children: [
                    Container(
                      color: Colors.blueAccent.withOpacity(.5),
                      padding: viscHorizontalMargin(context),
                      child: Text(
                        'Horizontal Margin',
                        style: ViscTypo.bodyMedium(context),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('data'),
                    )
                  ],
                ),
                Container(
                  color: Colors.greenAccent.withOpacity(.5),
                  padding: viscVerticalPadding(context),
                  child: Text(
                    'Vertical Padding',
                    style: ViscTypo.bodyMedium(context),
                  ),
                ),
                Container(
                  color: Colors.yellowAccent.withOpacity(.5),
                  padding: viscAllPadding(context),
                  child: Text(
                    'All Padding',
                    style: ViscTypo.bodyMedium(context),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.blueAccent.withOpacity(.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Display Large',
                  style: ViscTypo.displayLarge(context),
                ),
                Text(
                  'Display Medium',
                  style: ViscTypo.displayMedium(context),
                ),
                Text(
                  'Display Small',
                  style: ViscTypo.displaySmall(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
