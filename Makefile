# Step Generate
step_1:
	make gen

step_2:
	cd compress
	make build_ios
	cd ..

step_3:
	cd compress
	make build_android
	cd ..

step_4:
	make step_1

gen:
	flutter_rust_bridge_codegen \
		--class-name ImgCompress \
		--skip-deps-check \
		--rust-input compress/src/api.rs \
		--dart-output lib/imgcompress.g.dart \
		--dart-decl-output lib/imgcompress.d.dart \
		-c ios/Classes/libcompress.h