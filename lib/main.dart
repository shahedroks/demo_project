import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app.dart';

void main() {
  runApp(ProviderScope(
    child: ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
<<<<<<< Updated upstream
        child: const App(),
      ),
    ),
  );
=======
        useInheritedMediaQuery: true,
        child: App()),
  ));
>>>>>>> Stashed changes
}
