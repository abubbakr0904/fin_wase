import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AmountInput extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<double> amount;

  const AmountInput({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.amount,
  });

  @override
  State<AmountInput> createState() => _AmountInputState();
}

class _AmountInputState extends State<AmountInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.15),
          spreadRadius: 15,
          blurRadius: 10,
          offset: const Offset(10, 10),
        ),
      ]),
      // padding: EdgeInsets.symmetric(vertical: 5.w),
      child: TextField(
        focusNode: widget.focusNode,
        controller: widget.controller,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(9),
        ],
        onChanged: (v) {
          int amountInt = int.parse(v);
          widget.amount.call(double.parse(v));
          String amountText =
          NumberFormat.decimalPattern("uz").format(amountInt);
          debugPrint("AMOUNT:$amountText");
          widget.controller.value = TextEditingValue(text: amountText);
          setState(() {});
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          suffixIcon: widget.controller.text.isNotEmpty
              ? IconButton(
            onPressed: () {
              widget.controller.clear();
            },
            icon: const Icon(Icons.clear),
          )
              : null,
          contentPadding:
          EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
          hintText: "Summa (UZS)",
          hintStyle: const TextStyle(color: Colors.black, fontSize: 14),
          border: InputBorder.none,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.w, color: Colors.red),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.w, color: Colors.red),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        keyboardType: TextInputType.number,
        // maxLines: ,
        textAlign: TextAlign.start,
      ),
    );
  }
}