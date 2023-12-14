all-dev:
	$(MAKE) pub-get-all
	$(MAKE) generate-code-all
	$(MAKE) run-dev

watch-runner:
	flutter packages pub run build_runner watch --delete-conflicting-outputs

analyze:
	flutter analyze

run:
	$(MAKE) analyze
	flutter run --target lib/main_$(ENV).dart --flavor $(ENV) $(FLAGS)

run-dev:
	$(MAKE) run ENV=dev

pub-get-all:
	@find . -name pubspec.yaml -exec echo "### Getting packages for {}" \; \
  	-execdir flutter pub get \;

generate-code-all:
	@find . -name pubspec.yaml -exec echo "### Generating sources for {}" \; \
    -execdir flutter pub run build_runner build --delete-conflicting-outputs \;

share-dev-apk:
	flutter build apk --target lib/main_dev.dart --release --obfuscate --split-debug-info=build/symbols/android/dev --no-tree-shake-icons
	firebase appdistribution:distribute build/app/outputs/flutter-apk/app-dev-release.apk --app 1:110625952909:android:0082016c9112fbb65f7ec4 --groups qa-and-developers


