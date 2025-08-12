import 'package:flutter/material.dart';
import 'package:flutter_stacked_navbar/flutter_stacked_navbar.dart';

class NavItemWidget extends StatelessWidget {
  final int itemIndex;
  final NavItem navItem;
  final Function(int)? onTabClicked;
  final bool isSelected;
  final Color activeColor;
  final Color inactiveColor;

  const NavItemWidget({
    super.key,
    required this.itemIndex,
    required this.navItem,
    this.onTabClicked,
    this.isSelected = false,
    this.activeColor = Colors.blueGrey,
    this.inactiveColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => onTabClicked?.call(itemIndex),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isSelected ? const SizedBox(height: 20) : navItem.icon,
            Text(
              navItem.title,
              style: TextStyle(
                fontSize: 14,
                height: 2,
                fontWeight: FontWeight.w700,
                color: isSelected ? activeColor : inactiveColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
