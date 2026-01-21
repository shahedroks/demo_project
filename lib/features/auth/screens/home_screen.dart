import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ✅ Bottom nav স্ক্রিনশটের মতো fixed
      bottomNavigationBar: const _BottomNavBar(selectedIndex: 2),

      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.h),

                    // ✅ Header
                    _Header(
                      onMenuTap: () {},
                      onEditTap: () {},
                    ),

                    SizedBox(height: 16.h),

                    // ✅ Category pills (Light selected)
                    Row(
                      children: [
                        Expanded(
                          child: _CategoryPill(
                            label: 'Light',
                            isSelected: true,
                            icon: Icons.lightbulb_outline,
                            imagePath: 'assets/Mask group (3).png',
                            onTap: () {},
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: _CategoryPill(
                            label: 'Shading',
                            isSelected: false,
                            icon: Icons.blinds_outlined,
                            imagePath: 'assets/Mask group (2).png',
                            onTap: () {},
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: _CategoryPill(
                            label: 'HVAC',
                            isSelected: false,
                            icon: Icons.ac_unit_outlined,
                            imagePath: 'assets/Mask group (4).png',
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 18.h),

                    const _SectionTitle('Light'),
                    SizedBox(height: 12.h),

                    // ✅ Light section grid 2x2
                    GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 2,
  crossAxisSpacing: 12.w,
  mainAxisSpacing: 12.h,
  childAspectRatio: 195 / 185, // ✅ FIX: image-1 ratio
),
                      children: const [
                        _LightDimmerCard(
                          title: 'Bedroom spot light\nsmall patio blue light',
                          percent: 0.72,
                          mode: 'A',
                          modeFilled: false,
                          imagePath: 'assets/Mask group (5).png',
                        ),
                        _ThermostatCard(
                          title: 'Bathroom heating and\nboiler thermostat',
                          value: 24.6,
                          mode: 'M',
                          modeFilled: true,
                          imagePath: 'assets/Mask group (6).png',
                        ),
                        _BlindCard(
                          title: 'Blind Living Room\nnorth window',
                          downPercent: 0,
                          upPercent: 72,
                          mode: 'M',
                          modeFilled: true,
                          imagePath: 'assets/Rectangle 823.png',
                        ),
                        _ToggleCard(
                          title: 'Irrigation entry and\nfront home two valve',
                          isOn: true,
                          mode: 'A',
                          modeFilled: false,
                          imagePath: 'assets/Mask group (7).png',
                        ),
                      ],
                    ),

                    SizedBox(height: 18.h),

                    const _SectionTitle('Lighting'),
                    SizedBox(height: 12.h),

                     _buildLightingSectionCards(),
               
                    SizedBox(height: 18.h),

                    const _SectionTitle('Favorites'),
                    SizedBox(height: 12.h),

                    // ✅ Favorites rows (2 row)
                    Column(
                      children: const [
                        _FavoritesRow(mode: 'M', modeFilled: true),
                        SizedBox(height: 12),
                        _FavoritesRow(mode: 'A', modeFilled: false),
                      ],
                    ),

                    SizedBox(height: 18.h),

                    const _SectionTitle('Shading'),
                    SizedBox(height: 12.h),

                    // ✅ Shading list
                    const _ShadingTile(mode: 'M', modeFilled: true),
                    SizedBox(height: 12.h),
                    const _ShadingTile(mode: 'A', modeFilled: false),
                    SizedBox(height: 12.h),
                    const _ShadingTile(mode: 'M', modeFilled: true),

                    SizedBox(height: 18.h),

                    const _SectionTitle('Chart Section'),
                    SizedBox(height: 12.h),

                    // ✅ Chart card
                    const _ChartCard(),

                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildLightingSectionCards() {
    return Column(
      children: [
        // First row of cards
        Row(
          children: [
            Expanded(
              child: _buildLightingCard(
                deviceName: 'Light Scene child room',
                status: 'All On',
                iconImage: 'assets/images/dcdf1889f2f1df21a26d7013b207a1a5cb57f5e9.png',
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildLightingCard(
                deviceName: 'RGBW light patio entry',
                status: '100%',
                iconImage: 'assets/images/934930601db8766eee59e9c047c0269d6dba1f55.png',
              ),
            ),
            SizedBox(width: 12.w),
         Expanded(
  child:Stack(
  clipBehavior: Clip.none,
  children: [
    Row(
      children: [
        Expanded(
          child: _buildLightingCard(
            deviceName: 'LED Dimmer living room',
            status: '100%',
            iconImage: 'assets/images/934930601db8766eee59e9c047c0269d6dba1f55.png',
            progressCircle: true,
          ),
        ),
      ],
    ),
    Positioned(
      right: 7.w, // ✅ outside, but doesn't shrink the card
      top: 7.h,
      child: _ModeBadge(mode: 'A', filled: false),
    ),
  ],
),

),


          ],
        ),
        SizedBox(height: 12.h),
        // Second row of cards
        Row(
          children: [
            Expanded(
              child: _buildLightingCard(
                deviceName: 'Light Scene child room',
                status: 'All On',
                iconImage: 'assets/images/dcdf1889f2f1df21a26d7013b207a1a5cb57f5e9.png',
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildLightingCard(
                deviceName: 'RGBW light\npatio entry',
                status: '100%',
                iconImage: 'assets/images/934930601db8766eee59e9c047c0269d6dba1f55.png',
              ),
            ),
            SizedBox(width: 12.w),
           Expanded(
  child: Stack(
  clipBehavior: Clip.none,
  children: [
    Row(
      children: [
        Expanded(
          child: _buildLightingCard(
            deviceName: 'LED Dimmer living room',
            status: '100%',
            iconImage: 'assets/images/934930601db8766eee59e9c047c0269d6dba1f55.png',
            progressCircle: true,
          ),
        ),
      ],
    ),
    Positioned(
      right: 7.w,
      top: 7.h,
      child: _ModeBadge(mode: 'M', filled: true),
    ),
  ],
),

),

          ],
        ),
      ],
    );
  }
  Widget _buildLightingCard({
    required String deviceName,
    required String status,
    required String iconImage,
    bool progressCircle = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(26.r),
      ),
      padding: EdgeInsets.all(12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top icon area
          progressCircle
              ? _lightingProgress100()
              : Image.asset(
                  iconImage,
                  width: 52.w,
                  height: 52.h,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 52.w,
                    height: 52.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
          SizedBox(height: 8.h),
          // Device name
          Flexible(
            child: Text(
              deviceName,
              style: TextStyle(
                fontSize: 13.sp,
                color: const Color(0xFF111827),
                height: 1.15,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 8.h),
          // Status
          Text(
            status,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF111827),
            ),
          ),
        ],
      ),
    );
  }

  Widget _lightingProgress100() {
    return Container(
      width: 52.w,
      height: 52.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFF0088FE), // solid ring like Image-1
          width: 3.w,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        '100%',
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF111827),
        ),
      ),
    );
  }


}

// ---------------------------
// Header
// ---------------------------
class _Header extends StatelessWidget {
  const _Header({required this.onMenuTap, required this.onEditTap});

  final VoidCallback onMenuTap;
  final VoidCallback onEditTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onMenuTap,
          borderRadius: BorderRadius.circular(12.r),
          child: SizedBox(
            width: 44.w,
            height: 44.w,
            child: Center(
              child: Image.asset(
                'assets/Group 35 (1).png',
                width: 22.w,
                height: 22.w,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF111827),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: onEditTap,
          borderRadius: BorderRadius.circular(999),
          child: Container(
            width: 36.w,
            height: 36.w,
            decoration: const BoxDecoration(
              color: Color(0xFFF3F4F6),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                'assets/image 89.png',
                width: 18.w,
                height: 18.w,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ---------------------------
// Category pill
// ---------------------------
class _CategoryPill extends StatelessWidget {
  const _CategoryPill({
    required this.label,
    required this.isSelected,
    required this.icon,
    required this.onTap,
    this.imagePath,
  });

  final String label;
  final bool isSelected;
  final IconData icon;
  final VoidCallback onTap;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: isSelected
          ? Container(
              height: 54.h,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFFD700), // Yellow
                    Color(0xFF00FF00), // Green
                    Color(0xFF87CEEB), // Light blue
                  ],
                ),
                borderRadius: BorderRadius.circular(999),
              ),
              padding: const EdgeInsets.all(1),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(999),
                ),
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Row(
                  children: [
                    Container(
                      width: 38.w,
                      height: 38.w,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF3F4F6),
                        shape: BoxShape.circle,
                      ),
                      child: imagePath != null
                          ? Center(
                              child: Image.asset(
                                imagePath!,
                                width: 18.w,
                                height: 18.w,
                                fit: BoxFit.contain,
                              ),
                            )
                          : Icon(icon, size: 18.sp, color: const Color(0xFF111827)),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF111827),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Container(
              height: 54.h,
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.74),
                border: Border.all(color: const Color(0xFFE1E1E1), width: 1),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Row(
                children: [
                  Container(
                    width: 38.w,
                    height: 38.w,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF3F4F6),
                      shape: BoxShape.circle,
                    ),
                    child: imagePath != null
                        ? Center(
                            child: Image.asset(
                              imagePath!,
                              width: 18.w,
                              height: 18.w,
                              fit: BoxFit.contain,
                            ),
                          )
                        : Icon(icon, size: 18.sp, color: const Color(0xFF111827)),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF111827),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF111827),
      ),
    );
  }
}

// ---------------------------
// Common Card Wrapper
// ---------------------------
class _CardShell extends StatelessWidget {
  const _CardShell({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(26.r), // ✅ FIX
      ),
      padding: EdgeInsets.all(16.w), // ✅ FIX
      child: child,
    );
  }
}


class _ModeBadge extends StatelessWidget {
  const _ModeBadge({required this.mode, required this.filled});

  final String mode;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32.w,
      height: 32.w,
      decoration: BoxDecoration(
        color: filled ? const Color(0xFF6B7280) : const Color(0xFFE1E1E1),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        mode,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: filled ? Colors.white : const Color(0xFF6B7280),
        ),
      ),
    );
  }
}

class _CircleBtn extends StatelessWidget {
  const _CircleBtn({required this.child, this.onTap});

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        width: 34.w,
        height: 34.w,
        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Center(child: child),
      ),
    );
  }
}

// ---------------------------
// Light Cards
// ---------------------------
class _LightDimmerCard extends StatelessWidget {
  const _LightDimmerCard({
    required this.title,
    required this.percent,
    required this.mode,
    required this.modeFilled,
    this.imagePath,
  });

  final String title;
  final double percent;
  final String mode;
  final bool modeFilled;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _CardShell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ icon size like image-1
              imagePath != null
                  ? Image.asset(imagePath!, width: 52.w, height: 52.w, fit: BoxFit.contain)
                  : Icon(Icons.lightbulb_outline, size: 52.sp, color: const Color(0xFF15DFFE)),

              SizedBox(height: 10.h),

              // ✅ title like image-1 (NOT huge)
              Text(
                title,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF111827),
                  height: 1.18,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              const Spacer(),

              // ✅ bottom row: 72% + pill slider (sun inside)
              Row(
                children: [
                  Text(
                    '${(percent * 100).round()}%',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF111827),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(child: _DimmerPill(percent: percent)),
                ],
              ),
            ],
          ),
        ),

        Positioned(
          right: 12.w,
          top: 12.w,
          child: _ModeBadge(mode: mode, filled: modeFilled),
        ),
      ],
    );
  }
}

class _DimmerPill extends StatelessWidget {
  const _DimmerPill({required this.percent});
  final double percent;

  @override
  Widget build(BuildContext context) {
    final p = percent.clamp(0.0, 1.0);

    return Container(
      height: 36.h, // ✅ image-1 height
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Stack(
        children: [
          // ✅ right grey segment (remaining)
          Align(
            alignment: Alignment.centerRight,
            child: FractionallySizedBox(
              widthFactor: (1 - p),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFD1D5DB),
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(999),
                    left: Radius.circular((1 - p) >= 0.98 ? 999 : 0),
                  ),
                ),
              ),
            ),
          ),

          // ✅ sun icon (left)
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 14.w),
              child: Icon(
                Icons.wb_sunny_outlined,
                size: 20.sp,
                color: const Color(0xFF111827),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class _ThermostatCard extends StatelessWidget {
  const _ThermostatCard({
    required this.title,
    required this.value,
    required this.mode,
    required this.modeFilled,
    this.imagePath,
  });

  final String title;
  final double value;
  final String mode;
  final bool modeFilled;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _CardShell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              imagePath != null
                  ? Image.asset(
                      imagePath!,
                      width: 44.w,
                      height: 44.w,
                      fit: BoxFit.contain,
                    )
                  : Icon(Icons.thermostat_outlined, size: 44.sp, color: const Color(0xFF0088FE)),
              SizedBox(height: 8.h),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 13.sp, color: const Color(0xFF111827), height: 1.15),
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _CircleBtn(child: Icon(Icons.remove, size: 18.sp)),
                  Text(
                    '${value.toStringAsFixed(1)}°c',
                    style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700, color: const Color(0xFF111827)),
                  ),
                  _CircleBtn(child: Icon(Icons.add, size: 18.sp)),
                ],
              ),
            ],
          ),
        ),
        Positioned(right: 12.w, top: 12.w, child: _ModeBadge(mode: mode, filled: modeFilled)),
      ],
    );
  }
}

class _BlindCard extends StatelessWidget {
  const _BlindCard({
    required this.title,
    required this.downPercent,
    required this.upPercent,
    required this.mode,
    required this.modeFilled,
    this.imagePath,
  });

  final String title;
  final int downPercent;
  final int upPercent;
  final String mode;
  final bool modeFilled;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _CardShell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (imagePath != null)
                Image.asset(
                  imagePath!,
                  width: 52.w,
                  height: 52.w,
                  fit: BoxFit.contain,
                ),
              SizedBox(height: 10.h),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF111827),
                    height: 1.18,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 8.h),
              // Bottom controls row
              Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _CircleBtn(child: Icon(Icons.keyboard_arrow_down, size: 18.sp)),
                      SizedBox(width: 6.w),
                      Image.asset(
                        'assets/Group 32.jpg',
                        width: 14.w,
                        height: 14.w,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 3.w),
                      Text(
                        '$downPercent%',
                        style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w700, color: const Color(0xFF111827)),
                      ),
                      SizedBox(width: 6.w),
                      Image.asset(
                        'assets/Vector 4.jpg',
                        width: 14.w,
                        height: 14.w,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 3.w),
                      Text(
                        '$upPercent%',
                        style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w700, color: const Color(0xFF111827)),
                      ),
                      SizedBox(width: 6.w),
                      _CircleBtn(child: Icon(Icons.keyboard_arrow_up, size: 18.sp)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(right: 12.w, top: 12.w, child: _ModeBadge(mode: mode, filled: modeFilled)),
      ],
    );
  }
}

class _ToggleCard extends StatelessWidget {
  const _ToggleCard({
    required this.title,
    required this.isOn,
    required this.mode,
    required this.modeFilled,
    this.imagePath,
  });

  final String title;
  final bool isOn;
  final String mode;
  final bool modeFilled;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _CardShell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              imagePath != null
                  ? Image.asset(
                      imagePath!,
                      width: 42.w,
                      height: 42.w,
                      fit: BoxFit.contain,
                    )
                  : Icon(Icons.water_drop_outlined, size: 42.sp, color: const Color(0xFF00C2FF)),
              SizedBox(height: 8.h),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 13.sp, color: const Color(0xFF111827), height: 1.15),
                ),
              ),
              SizedBox(height: 6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isOn ? 'On' : 'Off',
                    style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700, color: const Color(0xFF111827)),
                  ),
                  Switch(
                    value: isOn,
                    onChanged: (_) {},
                    activeColor: Colors.white,
                    activeTrackColor: const Color(0xFF0088FE),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(right: 12.w, top: 12.w, child: _ModeBadge(mode: mode, filled: modeFilled)),
      ],
    );
  }
}

// ---------------------------
// Lighting mini cards
// ---------------------------
class _MiniLightingCard extends StatelessWidget {
  const _MiniLightingCard({
    required this.title,
    required this.status,
    required this.icon,
    required this.showProgress,
    required this.mode,
  });

  final String title;
  final String status;
  final IconData icon;
  final bool showProgress;
  final String? mode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 132.w,
      child: Stack(
        children: [
          _CardShell(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, size: 38.sp, color: const Color(0xFF111827)),
                SizedBox(height: 4.h),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 13.sp, color: const Color(0xFF111827), height: 1.15),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  status,
                  style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700, color: const Color(0xFF111827)),
                ),
              ],
            ),
          ),

          if (showProgress)
            Positioned(
              right: 10.w,
              top: 10.w,
              child: SizedBox(
                width: 46.w,
                height: 46.w,
                child: CustomPaint(
                  painter: _CircularProgressPainter(progress: 1, strokeWidth: 3),
                  child: Center(
                    child: Text('100%', style: TextStyle(fontSize: 11.sp, color: const Color(0xFF111827))),
                  ),
                ),
              ),
            ),

          if (mode != null)
            Positioned(
              right: 10.w,
              top: 10.w,
              child: _ModeBadge(mode: mode!, filled: false),
            ),
        ],
      ),
    );
  }
}

// ---------------------------
// Favorites
// ---------------------------
class _FavoritesRow extends StatelessWidget {
  const _FavoritesRow({required this.mode, required this.modeFilled});

  final String mode;
  final bool modeFilled;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24.r),
                child: Container(
                  height: 132.h,
                  color: Colors.grey.shade300,
                  child: const Center(child: Icon(Icons.videocam_outlined)),
                ),
              ),
              Positioned(
                left: 12.w,
                bottom: 12.w,
                child: Text(
                  'Front Door\nCamera',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    shadows: [Shadow(color: Colors.black.withOpacity(0.35), blurRadius: 10)],
                  ),
                ),
              ),
              Positioned(right: 10.w, top: 10.w, child: _ModeBadge(mode: mode, filled: modeFilled)),
            ],
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 132.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(24.r),
                ),
                padding: EdgeInsets.all(14.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bedroom Thermostat\nparents room',
                      style: TextStyle(fontSize: 13.sp, color: const Color(0xFF111827), height: 1.15),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _CircleBtn(child: Icon(Icons.remove, size: 18.sp)),
                        Text('24.6°c', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700)),
                        _CircleBtn(child: Icon(Icons.add, size: 18.sp)),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(right: 10.w, top: 10.w, child: _ModeBadge(mode: mode, filled: modeFilled)),
            ],
          ),
        ),
      ],
    );
  }
}

// ---------------------------
// Shading tile
// ---------------------------
class _ShadingTile extends StatelessWidget {
  const _ShadingTile({required this.mode, required this.modeFilled});

  final String mode;
  final bool modeFilled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(24.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      child: Row(
        children: [
          Container(
            width: 42.w,
            height: 42.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF15DFFE), Color(0xFF0088FE)],
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Blind Living Room south window upside right',
                  style: TextStyle(fontSize: 13.sp, color: const Color(0xFF111827)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    _ModeBadge(mode: mode, filled: modeFilled),
                    SizedBox(width: 10.w),
                    Icon(Icons.arrow_downward, size: 16.sp),
                    SizedBox(width: 4.w),
                    Text('100%', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700)),
                    SizedBox(width: 10.w),
                    Icon(Icons.volume_up_outlined, size: 16.sp),
                    SizedBox(width: 4.w),
                    Text('50%', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700)),
                  ],
                ),
              ],
            ),
          ),
          _CircleBtn(child: Icon(Icons.keyboard_arrow_down, size: 20.sp)),
          SizedBox(width: 10.w),
          _CircleBtn(child: Icon(Icons.keyboard_arrow_up, size: 20.sp)),
        ],
      ),
    );
  }
}

// ---------------------------
// Chart card
// ---------------------------
class _ChartCard extends StatelessWidget {
  const _ChartCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color(0xFFE1E1E1)),
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: CustomPaint(
                painter: _SimpleWaveChartPainter(),
                child: Container(),
              ),
            ),
          ),
          Container(
            height: 42.h,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF1FF),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24.r),
                bottomRight: Radius.circular(24.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SimpleWaveChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = const Color(0xFF0088FE);

    final p2 = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xFF0088FE).withOpacity(0.10);

    final path = Path();
    final fill = Path();

    final mid = size.height * 0.55;
    path.moveTo(0, mid);
    fill.moveTo(0, size.height);
    fill.lineTo(0, mid);

    for (double x = 0; x <= size.width; x += 6) {
      final y = mid + math.sin(x / 22) * (size.height * 0.18) + math.sin(x / 9) * (size.height * 0.06);
      path.lineTo(x, y);
      fill.lineTo(x, y);
    }

    fill.lineTo(size.width, size.height);
    fill.close();

    canvas.drawPath(fill, p2);
    canvas.drawPath(path, p1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ---------------------------
// Bottom Nav
// ---------------------------
class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final items = const [
      _NavItemData('Devices', Icons.devices_outlined),
      _NavItemData('Analytics', Icons.bar_chart_outlined),
      _NavItemData('Voice', Icons.mic_none_outlined),
      _NavItemData('Notifications', Icons.notifications_none_outlined),
      _NavItemData('Automations', Icons.tune_outlined),
    ];

    return Container(
      height: 78.h,
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.90)),
      child: Column(
        children: [
          Container(height: 1, color: const Color(0xFFE1E1E1)),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(items.length, (i) {
                final isSelected = i == selectedIndex;
                return _BottomNavItem(
                  label: items[i].label,
                  icon: items[i].icon,
                  isSelected: isSelected,
                  showBadge: items[i].label == 'Notifications',
                );
              }),
            ),
          ),
          // underline indicator
          Container(
            height: 3.h,
            width: 70.w,
            margin: EdgeInsets.only(
              left: (selectedIndex * (MediaQuery.of(context).size.width / 5)) + 14.w,
              right: (4 - selectedIndex) * (MediaQuery.of(context).size.width / 5) + 14.w,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF0088FE),
              borderRadius: BorderRadius.circular(99),
            ),
          ),
          SizedBox(height: 6.h),
        ],
      ),
    );
  }
}

class _NavItemData {
  const _NavItemData(this.label, this.icon);
  final String label;
  final IconData icon;
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.showBadge,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final bool showBadge;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.w,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 22.sp, color: isSelected ? const Color(0xFF0088FE) : const Color(0xFF111827)),
              SizedBox(height: 4.h),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? const Color(0xFF0088FE) : const Color(0xFF111827),
                ),
              ),
            ],
          ),
          if (showBadge)
            Positioned(
              right: 10.w,
              top: 10.h,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFFE019A),
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Text(
                  '12',
                  style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w700, color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ---------------------------
// Circular progress painter
// ---------------------------
class _CircularProgressPainter extends CustomPainter {
  _CircularProgressPainter({required this.progress, required this.strokeWidth});

  final double progress;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final bg = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = const Color(0xFFE1E1E1);

    final fg = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..color = const Color(0xFF0088FE);

    canvas.drawCircle(center, radius, bg);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      fg,
    );
  }

  @override
  bool shouldRepaint(covariant _CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.strokeWidth != strokeWidth;
  }
}
