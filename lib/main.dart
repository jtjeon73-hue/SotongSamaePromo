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
      title: AppCatalog.siteName,
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

  void _exploreApp() => _scrollToAnchor('features');

  void _showAboutDialog() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('사매면 소개'),
        content: const SingleChildScrollView(
          child: Text(
            '전북 남원시 사매면은 문학·관광·농촌이 어우러진 지역입니다.\n\n'
            '혼불문학관, 서도역, 매화언덕 문화복합단지 등 지역 자원과 '
            '21개 마을 커뮤니티가 함께 성장하고 있습니다.\n\n'
            '소통사매는 주민의 생활정보, 방문객의 여행 안내, '
            '귀농귀촌 관심자의 정착 정보, 지역 발전의 참여 소식을 '
            '한곳에서 전달하는 사매면 맞춤 앱입니다.',
            style: TextStyle(height: 1.65),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('닫기')),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              _scrollToAnchor('tourism');
            },
            child: const Text('관광 보기'),
          ),
        ],
      ),
    );
  }

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
                  onNotifyTap: openLaunchNotifyEmail,
                ),
                KeyedSubtree(
                  key: _topKey,
                  child: HeroSection(
                    onExploreTap: _exploreApp,
                    onAboutTap: _showAboutDialog,
                    onNotifyTap: openLaunchNotifyEmail,
                  ),
                ),
                const SizedBox(height: 20),
                const AudienceSection(),
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
              child: _MobileStickyCta(onTap: openLaunchNotifyEmail),
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
          icon: const Icon(Icons.notifications_active_outlined),
          label: const Text('앱 출시 알림 받기', style: TextStyle(fontWeight: FontWeight.w800)),
        ),
      ),
    );
  }
}
