import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CodeTextField extends StatelessWidget {
  const CodeTextField({
    Key? key,
    required this.textEditingController,
    required this.onChanged,
    required this.focusNode,
    // required this.onTap,
    // this.color = false,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final void Function(String value) onChanged;
  final FocusNode focusNode;
  // final void Function() onTap;
  // final bool color;

  @override
  Widget build(BuildContext context) {
    return TextField(
      // onTap: onTap,
      cursorColor: Colors.white,
      controller: textEditingController,
      focusNode: focusNode,
      maxLines: 1,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      onChanged: onChanged,
      style: TextStyle(
          color: Color(0xff23203F),
          // color: Colors.white,
          fontFamily: 'Nunito',
        fontSize: 25.sp,
          fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        // fillColor: const Color(0xff6A90F2),
        // fillColor: !color ? const Color(0xff6A90F2) : Colors.white,
        filled: true,
        counterText: '',
        enabledBorder: border(borderColor: const Color(0xffD0D0D0)),
        focusedBorder: border(borderColor: const Color(0xff6A90F2)),
      ),
    );
  }

  OutlineInputBorder border({Color borderColor = Colors.grey}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: borderColor,width: 2),
      );
  }
}