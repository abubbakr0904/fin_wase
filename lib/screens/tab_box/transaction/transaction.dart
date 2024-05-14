// import 'package:abu_pay/utils/colors/app_colors.dart';
// import 'package:abu_pay/utils/images/app_images.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lottie/lottie.dart';
//
// class TranscationScreen extends StatefulWidget {
//   const TranscationScreen({super.key});
//
//   @override
//   State<TranscationScreen> createState() => _TranscationScreenState();
// }
//
// class _TranscationScreenState extends State<TranscationScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Stack(
//       children: [
//         Container(
//             width: double.infinity,
//             height: MediaQuery.of(context).size.height,
//             color: AppColors.accentBlue,
//             padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 30.w),
//             child: Column(
//               children: [
//                 Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           IconButton(
//                               onPressed: () {},
//                               icon: const Icon(
//                                 Icons.arrow_back_outlined,
//                                 color: Colors.white,
//                               )),
//                           Text(
//                             "Transaction",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 20.sp,
//                                 fontFamily: AppImages.fontPoppins,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ],
//                       ),
//                       Container(
//                         width: 30.w,
//                         height: 30.w,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(50.r),
//                             color: Colors.white),
//                         child: const Center(
//                           child: Icon(
//                             Icons.notifications,
//                             color: AppColors.accentBlue,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             )),
//         Container(
//           margin: EdgeInsets.only(top: 250.h),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(30.r),
//                 topRight: Radius.circular(30.r),
//               ),
//               color: Colors.white),
//           child : Center(
//
//           )
//         )
//       ],
//     ));
//   }
// }


import 'package:abu_pay/blocs/card/card_bloc.dart';
import 'package:abu_pay/blocs/card/card_state.dart';
import 'package:abu_pay/screens/tab_box/transaction/widget/amount_input.dart';
import 'package:abu_pay/screens/tab_box/transaction/widget/card_item_view.dart';
import 'package:abu_pay/screens/tab_box/transaction/widget/card_number_input.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../blocs/transactions/transaction_bloc.dart';
import '../../../data/models/card_model/card_model.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  int selectedCardIndex = 0;

  final TextEditingController cardNumberController = TextEditingController();
  final FocusNode cardFocusNode = FocusNode();

  final TextEditingController amountController = TextEditingController();
  final FocusNode amountFocusNode = FocusNode();

  CardModel senderCard = CardModel.initial();
  CardModel receiverCard = CardModel.initial();

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() {
    senderCard = context.read<CardBloc>().state.cards[0];
    List<CardModel> cards = context.read<CardBloc>().state.cards;
    cardNumberController.addListener(
          () {
        String receiverCardNumber =
        cardNumberController.text.replaceAll(" ", "");
        if (receiverCardNumber.length == 16) {
          for (var element in cards) {
            if (element.cardNumber == receiverCardNumber &&
                senderCard.cardNumber != receiverCardNumber) {
              receiverCard = element;

              context
                  .read<TransactionBloc>()
                  .add(SetReceiverCardEvent(cardModel: receiverCard));
              context
                  .read<TransactionBloc>()
                  .add(SetSenderCardEvent(cardModel: senderCard));

              setState(() {});
              break;
            } else {
              receiverCard = CardModel.initial();
            }
          }
        }
      },
    );
  }
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocBuilder<CardBloc, CardState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    CardNumberInput(
                      controller: cardNumberController,
                      focusNode: cardFocusNode,
                    ),
                    Visibility(
                      visible: cardNumberController.text.length == 19,
                      child: Row(
                        children: [
                          SizedBox(width: 24.w),
                          Text(
                            "Qabul qiluvchi: ${receiverCard.cardHolder.isEmpty ? "Topilmadi" : receiverCard.cardHolder}",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    Visibility(
                      child: AmountInput(
                        controller: amountController,
                        focusNode: amountFocusNode,
                        amount: (amount) {
                          if (amount >= 1000) {
                            context
                                .read<TransactionBloc>()
                                .add(SetAmountEvent(amount: amount));
                          }
                        },
                      ),
                    ),
                    TextButton(onPressed: (){
                      CardModel cardModel = CardModel.initial();
                      cardModel = cardModel.copyWith(cardNumber: state.cards[selectedCardIndex].cardNumber);
                      context.read<TransactionBloc>().add(
                        SetSenderCardEvent(cardModel: cardModel)
                      );
                      context.read<TransactionBloc>().add(CheckValidationEvent());
                    }, child: Text("salom"))
                  ],
                ),
              ),
              CarouselSlider(
                items: List.generate(
                  state.cards.length,
                      (index) {
                    CardModel cardModel = state.cards[index];
                    return CardItemView(
                      chipVisibility: false,
                      cardModel: cardModel,
                    );
                  },
                ),
                options: CarouselOptions(
                  aspectRatio: 16 / 7,
                  viewportFraction: 0.95,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  onPageChanged: (index, reason) {
                    selectedCardIndex = index;
                    debugPrint("INDEX:$index");
                    senderCard = state.cards[index];
                  },
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.1,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              // BlocListener<TransactionBloc, TransactionState>(
              //   listener: (context, state) {
              //     if (state.statusMessage == "not_validated") {
              //       ScaffoldMessenger.of(context).showSnackBar(
              //         const SnackBar(
              //           content: Text("Ma'lumotlar xato!"),
              //         ),
              //       );
              //     } else if (state.statusMessage == "validated") {
              //       Navigator.pop(context);
              //     }
              //   },
              //   child: ,
              // )

            ],
          );
        },
      ),
    );
  }
}