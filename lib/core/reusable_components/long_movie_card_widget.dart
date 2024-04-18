import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors_manager.dart';

class LongMovieCardWidget extends StatelessWidget {
  LongMovieCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/action.png"),
              SizedBox(width: 10.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Baghead",style: Theme.of(context).textTheme.titleMedium,),
                  SizedBox(height: 5.h,),
                  Text("2019",style: Theme.of(context).textTheme.headlineSmall,),
                  SizedBox(height: 5.h,),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: ColorsManager.selectedTabColor,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "8.5",
                        style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.headlineSmall),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h,),
          Container(color: Colors.white.withOpacity(0.4),height: 1.h,width: double.infinity,)
        ],
      ),
    );
  }
}
