import 'package:flutter/material.dart';

import 'data/app_catalog.dart';
import 'theme/app_colors.dart';
import 'theme/app_layout.dart';
import 'utils/contact_utils.dart';
import 'widgets/ai_section.dart';
import 'widgets/audience_section.dart';
import 'widgets/core_values_section.dart';
import 'widgets/cta_section.dart';
import 'widgets/development_section.dart';
import 'widgets/features_section.dart';
import 'widgets/footer_section.dart';
import 'widgets/hero_section.dart';
import 'widgets/top_navigation.dart';
import 'widgets/tourism_section.dart';
import 'widgets/villages_section.dart';

void main() {
  runApp(const SotongSamaePromoApp());
}

class SotongSamaePromoApp extends StatelessWidget {
  const SotongSamaePromoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppCatalog.ogTitle,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.green,
          brightness: Brightness.light,
          surface: AppColors.creamSurface,
        ),
        scaffoldBackgroundColor: AppColors.cream,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.textPrimary,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.green,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
      ),
      home: const PromoHomePage(),
    );
  }
}

class PromoHomePage extends StatefulWidget {
  const PromoHomePage({super.key});

  @override
  State<PromoHomePage> createState() => _PromoHomePageState();
}

class _PromoHomePageState extends State<PromoHomePage> {
  final _scrollController = ScrollController();
  final _topKey = GlobalKey();
  final _promoKey = GlobalKey();
  final _featuresKey = GlobalKey();
  final _villagesKey = GlobalKey();
  final _tourismKey = GlobalKey();
  final _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToAnchor(String anchor) {
    final key = switch (anchor) {
      'top' => _topKey,
      'promo' => _promoKey,
      'features' => _featuresKey,
      'villages' => _villagesKey,
      'tourism' => _tourismKey,
      'contact' => _contactKey,
      _ => _topKey,
    };
    final context = key.currentContext;
    if (context == null) return;
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _browsePromo() => _scrollToAnchor('promo');

  void _showFeatures() => _scrollToAnchor('features');

  void _contact() => _scrollToAnchor('contact');

  @override
  Widget build(BuildContext context) {
    final isMobile = AppLayout.isMobile(context);

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                TopNavigation(
                  onAnchorTap: _scrollToAnchor,
                  onContactTap: _contact,
                ),
                KeyedSubtree(
                  key: _topKey,
                  child: HeroSection(
                    onPromoBrowseTap: _browsePromo,
                    onFeaturesTap: _showFeatures,
                    onContactTap: _contact,
                  ),
                ),
                const SizedBox(height: 20),
                KeyedSubtree(
                  key: _promoKey,
                  child: const AudienceSection(),
                ),
                const SizedBox(height: 12),
                const CoreValuesSection(),
                FeaturesSection(sectionKey: _featuresKey),
                VillagesSection(sectionKey: _villagesKey),
                TourismSection(sectionKey: _tourismKey),
                const DevelopmentSection(),
                const AiSection(),
                CtaSection(
                  sectionKey: _contactKey,
                  onNotifyTap: openLaunchNotifyEmail,
                  onContactTap: openContactEmail,
                ),
                FooterSection(onAnchorTap: _scrollToAnchor),
                if (isMobile) const SizedBox(height: 72),
              ],
            ),
          ),
          if (isMobile)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: _MobileStickyCta(onTap: _contact),
            ),
        ],
      ),
    );
  }
}

class _MobileStickyCta extends StatelessWidget {
  const _MobileStickyCta({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 16),
      decoration: BoxDecoration(
        color: AppColors.creamSurface.withValues(alpha: 0.96),
        border: const Border(top: BorderSide(color: AppColors.warmBorder)),
        boxShadow: const [
          BoxShadow(color: Color(0x14000000), blurRadius: 16, offset: Offset(0, -4)),
        ],
      ),
      child: SafeArea(
        top: false,
        child: FilledButton.icon(
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.green,
            minimumSize: const Size.fromHeight(48),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
          onPressed: onTap,
          icon: const Icon(Icons.mail_outline),
          label: const Text('문의하기', style: TextStyle(fontWeight: FontWeight.w800)),
        ),
      ),
    );
  }
}
