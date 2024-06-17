#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint imgcompress.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'imgcompress'
  s.version          = '0.0.1'
  s.summary          = 'Image compress on Flutter'
  s.description      = <<-DESC
Image compress on Flutter
                       DESC
  s.homepage         = 'https://github.com/prongbang/imgcompress'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'inteniquetic' => 'prongbang' }
  s.source           = { :path => '.' }
  s.source_files          = 'Classes/**/*'
  s.public_header_files   = '**/*.h'
  s.static_framework      = true
  s.vendored_libraries    = "**/*.a"
  s.source_files          = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
