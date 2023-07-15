#
# Be sure to run `pod lib lint FlipperEventStoreVieweriOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FlipperEventStoreVieweriOS'
  s.version          = '0.1.0'
  s.summary          = 'A short description of FlipperEventStoreVieweriOS.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/HaiFengKao/FlipperEventStoreVieweriOS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Hai Feng Kao' => 'haifeng@cocoaspice.in' }
  s.source           = { :git => 'https://github.com/HaiFengKao/FlipperEventStoreVieweriOS.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'FlipperEventStoreVieweriOS/Classes/**/*'

  # s.resource_bundles = {
  #   'FlipperEventStoreVieweriOS' => ['FlipperEventStoreVieweriOS/Assets/*.png']
  # }

  s.swift_version = '5.0'
  s.public_header_files = 'FlipperEventStoreVieweriOS/Classes/FlipperEventStoreViewer.h'
  s.xcconfig = {
       'CLANG_CXX_LIBRARY' => 'libc++'
  }
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'FlipperKit'

  # shutup target has transitive dependencies that include statically linked binaries: (Flipper-Boost-iOSX and FlipperKit)) during validation.
  s.static_framework = true
end
