import 'package:flutter/material.dart';
import 'package:flutter_stacked_navbar/src/models/nav_item_model.dart';
import 'package:flutter_stacked_navbar/src/widgets/nav_item_widget.dart';

class StackedNavbar extends StatefulWidget {
  final double height;
  final List<NavItem> navItems;
  final Color backgroundColor;
  final Color activeLabelColor;
  final Color inactiveLabelColor;
  final Color activeNavColor;
  final double itemHeight;
  final Function(int)? onTabClicked;
  final int initialPage;
  final EdgeInsets? activePadding;

  const StackedNavbar({
    super.key,
    this.height = 100,
    required this.navItems,
    this.backgroundColor = Colors.white,
    this.activeLabelColor = Colors.blueGrey,
    this.inactiveLabelColor = Colors.black,
    this.activeNavColor = Colors.blueGrey,
    this.itemHeight = 50,
    this.onTabClicked,
    this.initialPage = 0,
    this.activePadding,
  });

  @override
  State<StackedNavbar> createState() => _StackedNavbarState();
}

class _StackedNavbarState extends State<StackedNavbar> {
  late int selectedPage;

  @override
  void initState() {
    super.initState();
    selectedPage = widget.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height + MediaQuery.of(context).padding.bottom,
      decoration: BoxDecoration(color: widget.backgroundColor),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.4),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: widget.navItems.map((item) {
                int itemIndex = widget.navItems.indexOf(item);
                return NavItemWidget(
                  itemIndex: itemIndex,
                  navItem: item,
                  onTabClicked: (index) {
                    setState(() => selectedPage = index);
                    widget.onTabClicked?.call(index);
                  },
                  isSelected: selectedPage == itemIndex,
                  activeColor: widget.activeLabelColor,
                  inactiveColor: widget.inactiveLabelColor,
                );
              }).toList(),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Row(
              children: widget.navItems.map((item) {
                final int itemIndex = widget.navItems.indexOf(item);
                return Expanded(
                  child: itemIndex == selectedPage
                      ? Container(
                          height: widget.itemHeight,
                          width: widget.itemHeight,
                          padding: widget.activePadding ?? EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: widget.activeNavColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: item.iconSelected,
                        )
                      : const SizedBox.shrink(),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
