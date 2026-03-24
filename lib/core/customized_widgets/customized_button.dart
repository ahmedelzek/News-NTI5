import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/app_colors.dart';

class CustomizedButton extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;
  final String? icon;
  const CustomizedButton({super.key, required this.text , this.onTap, this.icon});

  @override
  State<CustomizedButton> createState() => _CustomizedButtonState();
}

class _CustomizedButtonState extends State<CustomizedButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w,),
        height: 56.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.circular(32.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (widget.icon != null) ...[
              SizedBox(width: 8.w),
              SvgPicture.asset(
                widget.icon!,
                width: 16.w,
                height: 16.h,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
