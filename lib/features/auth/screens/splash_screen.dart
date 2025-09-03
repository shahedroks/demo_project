
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workpleis/core/constants/color_control/all_color.dart';
import 'package:workpleis/features/auth/logic/splash_login_check.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static final routeName = "/splash";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loginCheck(context) ;


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(3.r),
        child: Center(
          child: Column(
            children: [
              const Spacer(),
<<<<<<< Updated upstream
              Image.asset("assets/images/Logo.png"),
=======
                Image.asset(ImagePath.pngLogo,
                height: 150.h,
                width: 150.w,),
>>>>>>> Stashed changes
              SizedBox(height: 10.h),
              Spacer(),
              const CircularProgressIndicator(),
              SizedBox(height: 10.h),
              Text("v1.1.0",style: TextStyle(color: AllColor.white70),)     ,
              SizedBox(height: 20.h,)
            ],
          ),
        ),
      ),
    );
  }
}
