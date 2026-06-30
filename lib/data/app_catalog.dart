import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class PromoItem {
  const PromoItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.accentColor = AppColors.green,
    this.audience,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color accentColor;
  final String? audience;
}

class AudienceSegment {
  const AudienceSegment({
    required this.label,
    required this.headline,
    required this.description,
    required this.icon,
  });

  final String label;
  final String headline;
  final String description;
  final IconData icon;
}

class TourismSpot {
  const TourismSpot({
    required this.name,
    required this.summary,
    required this.icon,
    this.location,
    this.visitorNote,
    this.gradientColors = const [AppColors.deepGreen, AppColors.olive],
  });

  final String name;
  final String summary;
  final IconData icon;
  final String? location;
  final String? visitorNote;
  final List<Color> gradientColors;
}

class DevelopmentItem {
  const DevelopmentItem({
    required this.title,
    required this.description,
    required this.icon,
    this.highlights = const [],
    this.progress,
  });

  final String title;
  final String description;
  final IconData icon;
  final List<String> highlights;
  final double? progress;
}

class AiExample {
  const AiExample({required this.question, required this.answer});

  final String question;
  final String answer;
}

class PreparationStage {
  const PreparationStage({
    required this.step,
    required this.title,
    required this.description,
  });

  final int step;
  final String title;
  final String description;
}

abstract final class AppCatalog {
  static const brandName = '소통사매';
  static const siteName = '소통사매프로모';
  static const prelaunchBadge = '소통사매앱 출시 전 프로모 사이트';
  static const siteIntro = '소통사매앱 출시 전 프로모 사이트입니다.';
  static const siteUrl = 'https://jtjeon73-hue.github.io/SotongSamaePromo/';
  static const ogTitle = '소통사매앱 출시 전 프로모';
  static const ogDescription =
      '사매면 주민과 방문객을 위한 지역 맞춤 생활정보 플랫폼, 소통사매앱을 준비 중입니다.';
  static const metaDescription =
      '사매면 마을 소식, 관광 안내, 생활정보, 지역발전 이야기를 담을 소통사매앱을 미리 만나보세요.';
  static const ogImageUrl = '${siteUrl}og-image.png';
  static const tagline = '사매면 생활정보를 한눈에, 소통사매';
  static const subtitle =
      '마을 소식, 관광 안내, 생활 편의 정보, 지역 발전 이야기를 하나의 앱에서 볼 수 있도록 준비 중입니다.';
  static const heroLead =
      '소통사매는 사매면 주민과 방문객을 위한 지역 맞춤 정보 플랫폼으로 출시를 준비하고 있습니다.';
  static const appDescription =
      '공지와 마을 소식, 관광 안내, 생활 편의, 사매발전 참여까지 — 사매면 주민과 방문객을 위한 정보 공간을 준비하고 있습니다.';
  static const ctaTitle = '소통사매앱, 함께 만들어가겠습니다.';
  static const ctaSubtitle =
      '사매면에 꼭 필요한 정보, 추가되었으면 하는 기능, 개선 의견이 있다면 편하게 알려주세요.';
  static const preparationIntro =
      '소통사매는 완성된 서비스를 갑자기 공개하기보다, 지역에 필요한 기능을 먼저 소개하고 의견을 반영해 단계적으로 준비하고 있습니다.';

  // TODO: 앱스토어 링크 확정 후 교체
  static const playStoreUrl = '';
  static const contactEmail = 'sotongware@naver.com';

  static const heroStats = <({String value, String label})>[
    (value: '21', label: '마을 연결'),
    (value: '5', label: '핵심 탭'),
    (value: '8', label: '생활 메뉴'),
    (value: '출시', label: '예정'),
  ];

  static const navItems = <({String label, String anchor})>[
    (label: '홈', anchor: 'top'),
    (label: '기능 미리보기', anchor: 'features'),
    (label: '마을정보', anchor: 'villages'),
    (label: '관광', anchor: 'tourism'),
    (label: '문의', anchor: 'contact'),
  ];

  static const audienceSegments = <AudienceSegment>[
    AudienceSegment(
      label: '사매면 주민',
      headline: '마을 소식과 생활 정보를 더 쉽게',
      description: '마을 소식과 생활 정보를 더 쉽게 확인하고 싶은 분',
      icon: Icons.home_outlined,
    ),
    AudienceSegment(
      label: '사매면 방문객',
      headline: '관광지와 지역 정보 미리보기',
      description: '관광지와 지역 정보를 미리 살펴보고 싶은 분',
      icon: Icons.explore_outlined,
    ),
    AudienceSegment(
      label: '귀농·귀촌 관심자',
      headline: '사매면의 분위기와 생활 정보',
      description: '사매면의 분위기와 생활 정보를 알고 싶은 분',
      icon: Icons.cottage_outlined,
    ),
    AudienceSegment(
      label: '지역 활동가',
      headline: '마을 소식과 지역 발전 함께',
      description: '마을 소식과 지역 발전 정보를 함께 공유하고 싶은 분',
      icon: Icons.trending_up_outlined,
    ),
  ];

  static const coreValues = <PromoItem>[
    PromoItem(
      title: '지역 소식',
      subtitle: '면사무소 공지, 마을 소식, 생활 안내를 더 쉽게 전달할 수 있는 구조를 준비합니다.',
      icon: Icons.campaign_outlined,
      accentColor: AppColors.deepGreen,
      audience: '주민',
    ),
    PromoItem(
      title: '마을 정보',
      subtitle: '21개 마을의 이야기와 생활 정보를 한곳에서 볼 수 있는 공간을 계획하고 있습니다.',
      icon: Icons.diversity_3_outlined,
      accentColor: AppColors.olive,
      audience: '주민',
    ),
    PromoItem(
      title: '관광 안내',
      subtitle: '사매면을 찾는 방문객이 관광지와 주변 정보를 쉽게 살펴볼 수 있도록 구성합니다.',
      icon: Icons.landscape_outlined,
      accentColor: AppColors.green,
      audience: '방문객',
    ),
    PromoItem(
      title: '생활 편의',
      subtitle: '버스, 의료, 장보기, 시설 정보 등 생활에 필요한 정보를 정리할 예정입니다.',
      icon: Icons.home_repair_service_outlined,
      accentColor: AppColors.heroAccent,
      audience: '주민',
    ),
    PromoItem(
      title: '사매발전',
      subtitle: '주민 의견과 지역 사업 소식을 투명하게 공유할 수 있는 공간을 준비합니다.',
      icon: Icons.handshake_outlined,
      accentColor: AppColors.deepGreen,
      audience: '지역 발전',
    ),
    PromoItem(
      title: 'AI 마을비서',
      subtitle: '지역 정보를 자연어로 묻고 답하는 기능은 향후 확장 기능으로 검토 중입니다.',
      icon: Icons.smart_toy_outlined,
      accentColor: AppColors.green,
      audience: '준비 중',
    ),
  ];

  static const appTabs = <PromoItem>[
    PromoItem(
      title: '공지사항',
      subtitle: '행정, 생활 공지와 면사무소 소식을 쉽게 확인할 수 있도록 준비 중입니다.',
      icon: Icons.campaign_outlined,
    ),
    PromoItem(
      title: '마을소식',
      subtitle: '마을 게시판, 사진, 댓글, 좋아요 기능을 통해 주민 소통 공간을 만들 예정입니다.',
      icon: Icons.diversity_3_outlined,
    ),
    PromoItem(
      title: '사매발전',
      subtitle: '발전협의회, 청년회, 주민제안과 사업 진행 현황을 공유하는 공간으로 준비합니다.',
      icon: Icons.handshake_outlined,
    ),
    PromoItem(
      title: '관광',
      subtitle: '사매면 관광지와 주변 정보를 방문객이 쉽게 볼 수 있도록 구성합니다.',
      icon: Icons.landscape_outlined,
    ),
    PromoItem(
      title: '문의',
      subtitle: '앱 출시 전 의견, 제안, 문의를 받을 수 있는 연결 공간을 준비합니다.',
      icon: Icons.mail_outline,
    ),
  ];

  static const homeMenus = <PromoItem>[
    PromoItem(title: '행정', subtitle: '민원·지원사업·공지 정리 예정', icon: Icons.account_balance_outlined),
    PromoItem(title: '마을소식', subtitle: '21개 마을 게시판 연결 예정', icon: Icons.diversity_3_outlined),
    PromoItem(title: '사매발전', subtitle: '주민 참여와 미래 사업 소개 예정', icon: Icons.handshake_outlined),
    PromoItem(title: '농업', subtitle: '영농 일정·장비 정보 정리 예정', icon: Icons.agriculture_outlined),
    PromoItem(title: '축산', subtitle: '방역·사료 정보 모음 예정', icon: Icons.pets_outlined),
    PromoItem(title: '과수', subtitle: '작황·병해충·판로 안내 예정', icon: Icons.park_outlined),
    PromoItem(title: '생활', subtitle: '교통·의료·장보기 정보 정리 예정', icon: Icons.home_repair_service_outlined),
    PromoItem(title: '교육', subtitle: '학생·평생학습 정보 모음 예정', icon: Icons.school_outlined),
  ];

  static const preparationStages = <PreparationStage>[
    PreparationStage(
      step: 1,
      title: '프로모션 사이트 공개',
      description: '출시 전 소통사매의 방향과 주요 메뉴를 미리 소개합니다.',
    ),
    PreparationStage(
      step: 2,
      title: '주요 메뉴와 정보 구조 정리',
      description: '주민과 방문객에게 필요한 정보를 어떻게 담을지 구조를 다듬고 있습니다.',
    ),
    PreparationStage(
      step: 3,
      title: '주민 의견 수렴',
      description: '필요한 기능과 개선 의견을 받아 서비스 방향에 반영할 예정입니다.',
    ),
    PreparationStage(
      step: 4,
      title: '소통사매앱 출시 준비',
      description: '의견을 반영해 단계적으로 앱 출시를 준비하고 있습니다.',
    ),
  ];

  static const featuredVillages = ['하신마을', '학동마을', '풍촌마을', '덕평마을', '화정마을', '도루메마을'];

  static const allVillages = <String>[
    '하신마을', '중신마을', '학동마을', '신촌마을', '오현마을', '풍촌마을',
    '관촌마을', '상신마을', '대산마을', '덕평마을', '수월마을', '손율마을',
    '인화마을', '계동마을', '수동마을', '노봉마을', '서촌마을', '수촌마을',
    '도루메마을', '대율마을', '화정마을',
  ];

  static const tourismSpots = <TourismSpot>[
    TourismSpot(
      name: '혼불문학관',
      summary: '문학과 지역 이야기가 만나는 사매 대표 문화 관광지. 방문 전 운영시간과 위치를 미리 확인하세요.',
      visitorNote: '문학 산책·전시 관람',
      icon: Icons.menu_book_outlined,
      location: '전북 남원시 사매면 혼불문학로 일원',
      gradientColors: [Color(0xFF14532D), Color(0xFF166534)],
    ),
    TourismSpot(
      name: '서도역',
      summary: '느린 시간의 간이역 풍경과 영화 촬영지 이야기. 감성 여행객에게 특히 잘 맞는 코스입니다.',
      visitorNote: '포토존·철길 산책',
      icon: Icons.train_outlined,
      location: '전북 남원시 사매면 서도역길 일원',
      gradientColors: [Color(0xFF365314), Color(0xFF6F7F35)],
    ),
    TourismSpot(
      name: '오리정휴게소',
      summary: '여행길에 잠시 쉬어가기 좋은 사매의 따뜻한 휴식 공간. 간단한 먹거리와 주변 안내도 함께.',
      visitorNote: '드라이브 휴식',
      icon: Icons.local_cafe_outlined,
      location: '전북 남원시 사매면 오리정 일원',
      gradientColors: [Color(0xFF92400E), Color(0xFFB07A3A)],
    ),
    TourismSpot(
      name: '매화언덕 문화복합단지',
      summary: '매화와 문화 행사가 어우러지는 사매의 미래 관광 거점. 사업 진행과 행사 일정도 함께 안내할 예정입니다.',
      visitorNote: '문화·축제 거점',
      icon: Icons.local_florist_outlined,
      location: '전북 남원시 사매면 매화언덕 예정 부지',
      gradientColors: [Color(0xFF831843), Color(0xFFBE185D)],
    ),
    TourismSpot(
      name: '사매 둘레길',
      summary: '완만한 코스와 마을 풍경을 따라 걷는 생활형 산책로. 가족·어르신 동반 산책에도 좋습니다.',
      visitorNote: '가벼운 트레킹',
      icon: Icons.hiking_outlined,
      location: '사매면 주요 마을길 및 들녘 구간',
      gradientColors: [Color(0xFF14532D), Color(0xFF15803D)],
    ),
    TourismSpot(
      name: '사매 맛집 및 로컬푸드',
      summary: '주민이 추천하는 식당과 농산물 직거래 정보. 사매의 맛과 로컬푸드를 안내할 예정입니다.',
      visitorNote: '향토 음식·직거래',
      icon: Icons.restaurant_outlined,
      location: '사매면 식당 및 로컬푸드 판매처',
      gradientColors: [Color(0xFF713F12), Color(0xFFCA8A04)],
    ),
  ];

  static const developmentItems = <DevelopmentItem>[
    DevelopmentItem(
      title: '발전협의회',
      description: '주민 대표가 모여 사매면의 주요 의제를 논의하고, 실행 결과를 투명하게 공유하는 공간을 준비합니다.',
      icon: Icons.groups_2_outlined,
      highlights: ['회의 일정·결과 공개 예정', '추진 사업 안내', '주민 건의사항 접수'],
    ),
    DevelopmentItem(
      title: '청년회',
      description: '청년 활동·봉사·행사와 귀농귀촌 네트워크를 잇는 사매면의 젊은 에너지 허브로 구성할 예정입니다.',
      icon: Icons.emoji_people_outlined,
      highlights: ['청년 기획단 소개', '어르신 스마트폰 교육', '귀농귀촌 환영 모임'],
    ),
    DevelopmentItem(
      title: '매화언덕 문화복합단지',
      description: '문화·관광·주민 행사를 연결하는 복합단지 사업. 진행 상황을 함께 따라갈 수 있도록 준비합니다.',
      icon: Icons.local_florist_outlined,
      highlights: ['사업 진행 현황 안내', '주민 설명회 자료', '문화·관광 거점 조성'],
      progress: 0.64,
    ),
  ];

  static const aiExamples = <AiExample>[
    AiExample(
      question: '오늘 면사무소 공지 알려줘',
      answer: '주민등록 민원 처리 시간, 농번기 행정 상담 예약 등 면사무소 공지를 출시 후 바로 안내할 예정입니다.',
    ),
    AiExample(
      question: '혼불문학관 운영시간 알려줘',
      answer: '운영시간·위치·전화번호·사진·영상·길찾기까지 관광 상세 정보와 연결될 예정입니다.',
    ),
    AiExample(
      question: '사매면 행사 일정 알려줘',
      answer: '면민의 날, 청년회 봉사, 매화언덕 문화복합단지 행사 일정을 중심으로 알려드립니다.',
    ),
    AiExample(
      question: '귀농 지원사업 알려줘',
      answer: '정착 상담, 농가 멘토 연결, 귀농귀촌 청년 네트워크, 농업 교육 정보를 우선 안내합니다.',
    ),
  ];

  static const developmentMessage =
      '주민 의견과 지역 사업 소식을 투명하게 나누는 사매면 디지털 공간을 준비하고 있습니다.';
}
