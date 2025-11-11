import 'package:adv/core/constant/app_assets.dart';
import 'package:adv/core/constant/app_colors.dart';
import 'package:adv/core/exports/ui_exports.dart';
import 'package:flutter/material.dart';

class CustomCommentField extends StatefulWidget {
  final Function(String) onSend;

  const CustomCommentField({
    super.key,
    required this.onSend,
  });

  @override
  _CustomCommentFieldState createState() => _CustomCommentFieldState();
}

class _CustomCommentFieldState extends State<CustomCommentField> {
  final TextEditingController _controller = TextEditingController();

  void _handleSend() {
    if (_controller.text.trim().isEmpty) return;
    widget.onSend(_controller.text.trim());
    _controller.clear();
    setState(() {}); // Update UI after clearing text
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(8),
            child: SizedBox(
              height: 16,
                width: 16,
              child: SvgPicture.asset(AppAssets.commentIcon),
            ),
            ),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _controller,
              onChanged: (value) => setState(() {}),
              decoration: InputDecoration(
                hintText: "Add a Comment......",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
          GestureDetector(
            onTap: _controller.text.trim().isEmpty ? null : _handleSend,
            child: Icon(
              _controller.text.trim().isEmpty
                  ? Icons.emoji_emotions_outlined
                  : Icons.send,
              color: _controller.text.trim().isEmpty ? Colors.grey : Colors.green,
            ),
          )
        ],
      ),
    );
  }
}