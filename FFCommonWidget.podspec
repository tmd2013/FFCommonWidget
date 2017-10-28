#
# Be sure to run `pod lib lint FFCommonWidget.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FFCommonWidget'
  s.version          = '0.1.6'
  s.summary          = '选择照片'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
修复bundle和图片找不到bug
                       DESC

  s.homepage         = 'https://github.com/tmd2013/FFCommonWidget'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'nono' => '399820721@qq.com' }
  s.source           = { :git => 'https://github.com/tmd2013/FFCommonWidget.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  # s.source_files = 'FFCommonWidget/Classes/**/*'
  s.subspec 'FFPhotoSelected' do |p|
        p.source_files = 'FFCommonWidget/Classes/FFPhotoSelected/*.{h,m,xib}'
    end
  
  s.resource_bundles = {
     'FFCommonWidget' => ['FFCommonWidget/Assets/*.png']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
