import 'package:flutter/material.dart';

class HoverButtonTextWidget extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const HoverButtonTextWidget({Key? key, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.black54, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class IconTextWidget extends StatelessWidget {
  final String title;
  final Icon icon;
  const IconTextWidget({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 5),
            Text(
              title,
              style: const TextStyle(color: Colors.black54, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class OrangeColorButton extends StatefulWidget {
  const OrangeColorButton(
      {Key? key,
      this.onTap,
      required this.title,
      this.textSize = 14,
      this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10)})
      : super(key: key);

  final void Function()? onTap;
  final String title;
  final double textSize;
  final EdgeInsets padding;

  @override
  State<OrangeColorButton> createState() => _OrangeColorButtonState();
}

class _OrangeColorButtonState extends State<OrangeColorButton> {
  Color buttonColor = Colors.yellow.shade500;
  Color textColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        primary: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      onHover: (hover) {
        if (hover) {
          setState(() {
            buttonColor = Colors.purple;
            textColor = Colors.white;
          });
        } else {
          setState(() {
            buttonColor = Colors.yellow.shade500;
            textColor = Colors.black;
          });
        }
      },
      onPressed: widget.onTap,
      child: Padding(
        padding: widget.padding,
        child: Text(
          widget.title,
          style: TextStyle(
            color: textColor,
            fontSize: widget.textSize,
            fontWeight:
                widget.textSize >= 16.0 ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
