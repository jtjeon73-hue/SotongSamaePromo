# 소통사매프로모

소통사매 앱 홍보용 Flutter Web 랜딩 사이트입니다.

## 실행

```bash
flutter pub get
flutter run -d chrome
```

헤드리스 환경:

```bash
flutter run -d web-server --web-port=8080 --web-hostname=0.0.0.0
```

## 빌드 (GitHub Pages)

```bash
flutter build web --release --base-href "/SotongSamaePromo/"
```

## 주요 파일

- `lib/main.dart` — 앱 진입점 및 페이지 조립
- `lib/data/app_catalog.dart` — 홍보 콘텐츠 데이터
- `lib/widgets/` — 섹션별 위젯
