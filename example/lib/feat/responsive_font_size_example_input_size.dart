import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:visc_utils/visc_utils.dart';

class ResponsiveFontSizeExampleInputSize extends StatefulWidget {
  const ResponsiveFontSizeExampleInputSize({
    super.key,
  });

  @override
  State<ResponsiveFontSizeExampleInputSize> createState() =>
      _ResponsiveFontSizeExampleInputSizeState();
}

class _ResponsiveFontSizeExampleInputSizeState
    extends State<ResponsiveFontSizeExampleInputSize> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController fontSize = TextEditingController(text: "16");

    return Container(
      color: Colors.blueAccent.withValues(alpha: .5),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: fontSize,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          const VerticalDivider(),
          Expanded(
            child: ListenableBuilder(
              listenable: fontSize,
              builder: (_, __) => Text(
                "THIS TEXT FONTSIZE BASE VALUE BESIDE",
                style: ViscTypo.defineSize(context,
                    size: double.tryParse(fontSize.text)),
              ),
            ),
          ),
          const VerticalDivider(),
          Expanded(
            child: ListenableBuilder(
              listenable: fontSize,
              builder: (_, __) => Text(
                "size After calculation => ${ViscTypo.defineSize(context, size: double.tryParse(fontSize.text))?.fontSize}",
                style: ViscTypo.defineSize(context,
                    size: double.tryParse(fontSize.text)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
