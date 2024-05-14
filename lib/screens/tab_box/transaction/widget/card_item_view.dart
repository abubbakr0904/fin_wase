import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../data/models/card_model/card_model.dart';

class CardItemView extends StatelessWidget {
  CardItemView({
    super.key,
    required this.cardModel,
    this.onTap,
    this.chipVisibility = true,
  });

  final CardModel cardModel;
  final VoidCallback? onTap;
  final bool chipVisibility;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 8.h,
        ),
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Colors.red,
              Color(int.parse("0xff${cardModel.color}")).withOpacity(0.5),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cardModel.bankName,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(locale: "uz").format(cardModel.balance),
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Visibility(
                visible: chipVisibility,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: Icon(
                    Icons.credit_card,
                    size: 56.sp,
                  )
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          maskFormatter.maskText(cardModel.cardNumber),
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              cardModel.expireDate,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          cardModel.cardHolder.toUpperCase(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: cardModel.type == -1
                        ? Icon(
                      Icons.credit_card,
                      size: 56.w,
                    )
                        : Icon(
                      Icons.credit_card,
                      size: 56.w,
                    )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  var maskFormatter = MaskTextInputFormatter(
    mask: '#### #### #### ####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
}