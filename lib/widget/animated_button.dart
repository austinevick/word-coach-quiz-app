import 'package:flutter/material.dart';
import '../constant.dart';

class AnimatedButton extends StatelessWidget {
  final Color color;
  final String options;
  final VoidCallback onTap;
  final bool showIcon;
  final IconData icon;

  const AnimatedButton(
      {super.key,
      required this.color,
      required this.options,
      required this.onTap,
      required this.showIcon,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 45,
      width: double.infinity,
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 1000),
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.white, width: 1.8),
          borderRadius: BorderRadius.circular(10)),
      child: MaterialButton(
          height: 45,
          minWidth: double.infinity,
          onPressed: onTap,
          padding: const EdgeInsets.all(0),
          child: AnimatedSwitcher(
              duration: duration,
              child: showIcon ? Icon(icon) : Text(options))),
    );
  }
}
