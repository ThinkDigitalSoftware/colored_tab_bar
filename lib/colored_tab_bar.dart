library colored_tab_bar;

import 'package:flutter/material.dart';

class ColoredTabBar extends Container implements PreferredSizeWidget {
  ColoredTabBar({@required this.color, this.tabBar});

  final Color color;
  final TabBar tabBar;

  @override
  Size get preferredSize =>
      tabBar?.preferredSize ?? Size(double.infinity, 48.0);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: tabBar ?? Container(),
    );
  }
}
