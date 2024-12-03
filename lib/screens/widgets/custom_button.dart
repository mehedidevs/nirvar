import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final double widthFactor;
  final double heightFactor;
  final List<Color> gradientColors;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.widthFactor = 0.9,
    this.heightFactor = 0.08,
    this.gradientColors = const [Color(0xFF6BB5BE), Color(0xFF74B192)],
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;
  Future<void> _handlePress() async {
    if (_isPressed) return;
    setState(() => _isPressed = true);
    try {
      widget.onPressed();
    } finally {
      setState(() => _isPressed = false);
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:_isPressed ? null : _handlePress,
      child: Container(
        width: ScreenUtil().screenWidth * widget.widthFactor,
        height: ScreenUtil().screenHeight * widget.heightFactor,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          gradient: LinearGradient(
            colors: widget.gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ),
    );
  }
}