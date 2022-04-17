import 'package:flutter/material.dart';
import 'package:puzzle_8/constants/style.dart';
import 'package:puzzle_8/widgets/customText.dart';

class DrawerMenuItem extends StatefulWidget {
  final void Function() onTap;
  final String itemName;

  const DrawerMenuItem({Key? key, required this.onTap, required this.itemName})
      : super(key: key);

  @override
  State<DrawerMenuItem> createState() => _DrawerMenuItemState();
}

class _DrawerMenuItemState extends State<DrawerMenuItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (value) {
        setState(() {
          isHovered = value;
        });
      },
      child: Ink(
        child: Center(
            child: CustomText(
          text: widget.itemName,
          color: drawerItemTextColor,
          size: 26,
        )),
        height: 50,
      ),
    );
  }
}
