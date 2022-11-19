ARG flutter_version=latest
FROM cirrusci/flutter:$flutter_version


ENV B_WORKDIR="/emprius-android/"
ARG SOURCE_PATH="./"

COPY "$SOURCE_PATH/" "$B_WORKDIR"

ENV APK_OUTPUT_DIR="/emprius-APK/"

WORKDIR "$B_WORKDIR"
RUN flutter packages upgrade && flutter build apk --flavor "$build_flavor" && \
	cp --recursive build/app/outputs/flutter-apk/ "$APK_OUTPUT_DIR"

WORKDIR /
RUN rm -rf "$B_WORKDIR"
