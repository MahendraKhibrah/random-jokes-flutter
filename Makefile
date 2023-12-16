all-dev:
	$(MAKE) pub-get-all
	$(MAKE) generate-code-all
	$(MAKE) run-dev

all-prod:
	$(MAKE) pub-get-all
	$(MAKE) generate-code-all
	$(MAKE) run-prod

dependencies:
	flutter pub get

build-runner:
	flutter packages pub run build_runner build --delete-conflicting-outputs

watch-runner:
	flutter packages pub run build_runner watch --delete-conflicting-outputs

analyze:
	flutter analyze

clean_all:
	@find . -name pubspec.yaml -exec echo "### Cleaning {}" \; \
	-execdir flutter clean \;

pub-get-all:
	@find . -name pubspec.yaml -exec echo "### Getting packages for {}" \; \
  	-execdir flutter pub get \;

generate-code-all:
	@find . -name pubspec.yaml -exec echo "### Generating sources for {}" \; \
    -execdir flutter pub run build_runner build --delete-conflicting-outputs \;

preparation:
	cp lib/firebase/$(ENV)_firebase_options.dart lib/firebase_options.dart
	cp ios/$(ENV)/firebase_app_id_file.json ios/firebase_app_id_file.json
	cp ios/Runner/$(ENV)/GoogleService-Info.plist ios/Runner/GoogleService-Info.plist
	$(MAKE) analyze

run:
	$(MAKE) preparation ENV=$(ENV)
	flutter run --target lib/main_$(ENV).dart --flavor $(ENV) $(FLAGS)

run-dev:
	$(MAKE) run ENV=dev

run-prod:
	$(MAKE) run ENV=prod

share-preparation:
	$(MAKE) pub-get-all
	$(MAKE) generate-code-all
	$(MAKE) preparation ENV=dev

share-dev-apk:
	flutter build apk --target lib/main_dev.dart --flavor dev --release --obfuscate --split-debug-info=build/symbols/android/dev --no-tree-shake-icons
	firebase crashlytics:symbols:upload --app=1:110625952909:android:0082016c9112fbb65f7ec4 build/symbols/android/dev
	firebase appdistribution:distribute build/app/outputs/flutter-apk/app-dev-release.apk --app 1:110625952909:android:0082016c9112fbb65f7ec4 --release-notes-file release_notes/dev_release_notes.txt --groups dev-testers

share-dev-ipa:
	flutter build ipa --target lib/main_dev.dart --flavor dev --release --export-method=ad-hoc --no-tree-shake-icons
	firebase appdistribution:distribute build/ios/ipa/creator.ipa --app 1:110625952909:ios:192769fb2ff40cae5f7ec4 --release-notes-file release_notes/dev_release_notes.txt --groups dev-testers

share-dev-apk-with-preparation:
	$(MAKE) share-preparation
	$(MAKE) share-dev-apk

share-dev-ipa-with-preparation:
	$(MAKE) share-preparation
	$(MAKE) share-dev-ipa

share-dev-both:
	$(MAKE) share-preparation
	$(MAKE) share-dev-apk
	$(MAKE) share-dev-ipa