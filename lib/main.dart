import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  static const Color darkPurple = Color(0xFF4A148C);
  static const Color lightPurple = Color(0xFFAB47BC);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(
          seedColor: darkPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatelessWidget {
  const WeatherHomePage({super.key});

  static const Color darkPurple = WeatherApp.darkPurple;
  static const Color lightPurple = WeatherApp.lightPurple;

  @override
  Widget build(BuildContext context) {
    final List<ForecastDay> forecast = [
      ForecastDay(
        dayName: 'Mon',
        temperatureC: 19,
        imageAsset: 'assets_figma/Weather _))10 18.png',
        imageWidth: 66,
        imageHeight: 66,
        applyDropShadow: false,
      ),
      ForecastDay(
        dayName: 'Tue',
        temperatureC: 21,
        imageAsset: 'assets_figma/Weather _))10 18.png',
        imageWidth: 66,
        imageHeight: 66,
        applyDropShadow: false,
      ),
      ForecastDay(
        dayName: 'Wed',
        temperatureC: 18,
        imageAsset: 'assets_figma/Weather _))10 19.png',
        imageWidth: 66,
        imageHeight: 66,
        applyDropShadow: false,
      ),
      ForecastDay(
        dayName: 'Thu',
        temperatureC: 20,
        imageAsset: 'assets_figma/Weather _))10 19.png',
        imageWidth: 66,
        imageHeight: 66,
        applyDropShadow: false,
      ),
    ];

    return Scaffold(
      body: Container(
        width: 428,
        height: 926,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xFF800080), // Deep purple
              Color(0xFF1A0033), // Dark navy blue
            ],
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0xB23B267B),
              blurRadius: 150,
              offset: Offset(-40, 60),
            ),
          ],
        ),
        child: Stack(
          children: [

            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Status Bar - Centered
                    Center(
                      child: Container(
                        width: 427,
                        height: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 26),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Time
                            Padding(
                              padding: const EdgeInsets.only(top: 13.62),
                              child: SizedBox(
                                width: 66.84,
                                height: 25.99,
                                child: Text(
                                  '1:41',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                                                         // Status Icons
                             Padding(
                               padding: const EdgeInsets.only(top: 21),
                               child: Row(
                                 children: [
                                   const Icon(Icons.signal_cellular_4_bar, size: 16, color: Colors.white),
                                   const SizedBox(width: 6),
                                   const Icon(Icons.wifi, size: 16, color: Colors.white),
                                   const SizedBox(width: 7),
                                   const Icon(Icons.battery_full, size: 16, color: Colors.white),
                                 ],
                               ),
                             ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 94),
                    // Location & Temperature centered with Poppins 24px, letter spacing 0.47
                    Center(
                      child: SizedBox(
                        width: 428,
                        height: 52,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'North America',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              letterSpacing: 0.47,
                              height: 29.71 / 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: SizedBox(
                        width: 428,
                        height: 52,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Max: 24°   Min:18°',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              letterSpacing: 0.47,
                              height: 29.71 / 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // 7-Day Forecast heading centered, Open Sans 24 bold
                    Center(
                      child: Text(
                        '7-Days Forecasts',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          letterSpacing: 0.47,
                          height: 29.71 / 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                                         Center(
                       child: SizedBox(
                         height: 172,
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             for (final item in forecast)
                               Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 4),
                                 child: ForecastCard(day: item),
                               ),
                           ],
                         ),
                       ),
                     ),

                    const SizedBox(height: 24),

                    // Air Quality - Centered
                    Center(
                      child: AirQualityBox(
                        title: 'AIR QUALITY',
                        value: '3-Low Health Risk',
                        onSeeMore: () {
                          // Placeholder action
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Air Quality - See more')),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Sunrise/Sunset (replaced) and UV Index (new rectangle) - Centered
                    Center(
                      child: Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: const [
                          Group3436Box(width: 168, height: 150),
                          UvIndexRectBox(width: 161, height: 150),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ===========================
   Data Model
   =========================== */

class ForecastDay {
  final String dayName;
  final int temperatureC;
  final String imageAsset;
  final double imageWidth;
  final double imageHeight;
  final bool applyDropShadow;

  ForecastDay({
    required this.dayName,
    required this.temperatureC,
    required this.imageAsset,
    required this.imageWidth,
    required this.imageHeight,
    required this.applyDropShadow,
  });
}

/* ===========================
   Widgets
   =========================== */

class ForecastCard extends StatelessWidget {
  const ForecastCard({super.key, required this.day});

  final ForecastDay day;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 82,
      height: 172,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF3E2D8F),
            Color(0xFF533595),
            Color(0xFF9D52AC),
          ],
          stops: [0.0, 0.2244, 1.0],
        ),
        boxShadow: const [
          BoxShadow(color: Color(0x66120643), blurRadius: 64.01, offset: Offset(-12.8, 51.21)),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${day.temperatureC}°C',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          day.applyDropShadow
              ? Container(
                  width: day.imageWidth,
                  height: day.imageHeight,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x66120643),
                        blurRadius: 64.01,
                        offset: Offset(-12.8, 51.21),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    day.imageAsset,
                    fit: BoxFit.contain,
                  ),
                )
              : SizedBox(
                  width: day.imageWidth,
                  height: day.imageHeight,
                  child: Image.asset(
                    day.imageAsset,
                    fit: BoxFit.contain,
                  ),
                ),
          Text(
            day.dayName,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class AirQualityBox extends StatelessWidget {
  const AirQualityBox({
    super.key,
    required this.title,
    required this.value,
    this.onSeeMore,
  });

  final String title;
  final String value;
  final VoidCallback? onSeeMore;

  static const Color darkPurple = WeatherApp.darkPurple;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 352,
      height: 174,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment(-0.66, -0.75),
          end: Alignment(0.66, 0.75),
          colors: [Color(0xFF3E2D8F), Color(0xFF9D52AC)],
          stops: [0.293, 0.9429],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x66504E4E),
            blurRadius: 2,
            offset: Offset(2, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // crosshairs icon
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  'assets_figma/🦆 icon _crosshairs_.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    letterSpacing: 0.47,
                    height: 29.71 / 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.w600,
              fontSize: 28,
              letterSpacing: 0.47,
              height: 29.71 / 28,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 308,
              height: 5,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFF362A84),
                    Color(0xD1805BCA),
                    Color(0xFFBD08FC),
                  ],
                  stops: [0.0792, 0.5, 1.0],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              InkWell(
                onTap: onSeeMore,
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  child: Text(
                    'See more',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      letterSpacing: 0.47,
                      height: 29.71 / 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Transform.rotate(
                angle: -180 * 3.1415926535 / 180,
                child: SizedBox(
                  width: 18,
                  height: 30,
                  child: Image.asset('assets_figma/🦆 icon _chevron left_.png', color: Colors.white, fit: BoxFit.contain),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SunriseSunsetCard extends StatelessWidget {
  const SunriseSunsetCard({
    super.key,
    required this.diameter,
    required this.sunrise,
    required this.sunset,
  });

  final double diameter;
  final String sunrise;
  final String sunset;

  static const Color circleColor = WeatherApp.lightPurple;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: const BoxDecoration(
        color: circleColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 12,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SUNRISE',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.1,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              sunrise,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 6),
            Text(
              'Sunset',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Text(
              sunset,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class UvIndexCard extends StatelessWidget {
  const UvIndexCard({
    super.key,
    required this.diameter,
    required this.uvLabel,
  });

  final double diameter;
  final String uvLabel;

  static const Color circleColor = WeatherApp.lightPurple;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: const BoxDecoration(
        color: circleColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 12,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'UV INDEX',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.1,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              uvLabel,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class Group3436Box extends StatelessWidget {
  const Group3436Box({super.key, this.width = 168, this.height = 150});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment(-0.5, -0.9),
          end: Alignment(0.5, 0.9),
          colors: [Color(0xFF3E2D8F), Color(0x009D52AC)],
          stops: [0.1714, 0.9459],
        ),
        border: Border.all(color: const Color(0xFFF7CBFD), width: 1),
        boxShadow: const [
          BoxShadow(color: Color(0x66000000), blurRadius: 4, offset: Offset(0, 4)),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        'assets_figma/Group 3436.png',
        fit: BoxFit.cover,
      ),
    );
  }
}

class UvIndexRectBox extends StatelessWidget {
  const UvIndexRectBox({super.key, this.width = 161, this.height = 150});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment(-0.5, -0.9),
          end: Alignment(0.5, 0.9),
          colors: [Color(0xFF3E2D8F), Color(0x009D52AC)],
          stops: [0.1714, 0.9459],
        ),
        border: Border.all(color: const Color(0xFFF7CBFD), width: 1),
        boxShadow: const [
          BoxShadow(color: Color(0x66000000), blurRadius: 4, offset: Offset(0, 4)),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 36,
                height: 36,
                child: Image.asset('assets_figma/Star 2.png', fit: BoxFit.contain),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'UV INDEX',
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    letterSpacing: 0.47,
                    height: 29.71 / 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            '4 Moderate',
            style: GoogleFonts.openSans(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 26,
              letterSpacing: 0.47,
              height: 29.71 / 26,
            ),
          ),
        ],
      ),
    );
  }
}

class ChevronBorderButton extends StatelessWidget {
  const ChevronBorderButton({
    super.key,
    required this.direction,
    this.size = const Size(12, 24),
    this.rotationDegrees = 0,
  });

  final AxisDirection direction;
  final Size size;
  final double rotationDegrees;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(4),
      ),
      clipBehavior: Clip.antiAlias,
      child: Transform.rotate(
        angle: rotationDegrees * 3.1415926535 / 180,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Image.asset('assets_figma/🦆 icon _chevron left_.png', color: Colors.white),
        ),
      ),
    );
  }
}
