import 'package:flutter/material.dart';

import '../../../Utils/size_utils.dart';
import '../../../constants/constants.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
  });

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _isSelected = false;

  void _onTap() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox.adaptive(
      focusColor: Colors.white,
      overlayColor: const WidgetStatePropertyAll(Colors.white),
      activeColor: buttonGreen,
      value: _isSelected,
      onChanged: (value) => _onTap(),
    );
  }
}

class OptionsGrid extends StatefulWidget {
  final List<String> options;
  final bool exclusiveSwitching;

  const OptionsGrid({
    super.key,
    required this.options,
    this.exclusiveSwitching = false,
  });

  @override
  _OptionsGridState createState() => _OptionsGridState();
}

class _OptionsGridState extends State<OptionsGrid> {
  List<bool> isSwitched = [];

  @override
  void initState() {
    super.initState();

    isSwitched = List.generate(widget.options.length, (index) => false);
  }

  void _toggleSwitch(int index) {
    setState(() {
      if (widget.exclusiveSwitching) {
        for (int i = 0; i < isSwitched.length; i++) {
          isSwitched[i] = (i == index);
        }
      } else {
        isSwitched[index] = !isSwitched[index];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeUtils.width * 0.015),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: SizeUtils.width * .03,
          crossAxisSpacing: SizeUtils.width * .04,
          childAspectRatio: 3.5,
        ),
        itemCount: widget.options.length,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Switch(
                value: isSwitched[index],
                onChanged: (value) {
                  _toggleSwitch(index);
                },
                activeColor: buttonGreen,
                activeTrackColor: Colors.greenAccent.shade400,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey,
              ),
              Expanded(
                child: Text(
                  widget.options[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.fSize,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
