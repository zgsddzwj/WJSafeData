#
# Be sure to run `pod lib lint WJSafeData.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WJSafeData'
  s.version          = '0.1.0'
  s.summary          = '利用Runtime更改NSArray、NSDictionary，防止操作过程中因为越界引起的问题，及一些便捷提取方式。GitHub地址:https://github.com/zgsddzwj/WJSafeData.git'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/adwardgc/WJSafeData'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'adwardgc' => 'wangjian5@xin.com' }
  s.source           = { :git => 'https://github.com/adwardgc/WJSafeData.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'WJSafeData/Classes/**/*'
  
  # s.resource_bundles = {
  #   'WJSafeData' => ['WJSafeData/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
