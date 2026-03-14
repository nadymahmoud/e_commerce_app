import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

showAnimatedSnackBar(  BuildContext context ,{AnimatedSnackBarType ? type ,   String ? message})   {
  AnimatedSnackBar.material(  message ?? "Success" , type: type ?? AnimatedSnackBarType.success , mobileSnackBarPosition: MobileSnackBarPosition.bottom ,) .show(context);  
}