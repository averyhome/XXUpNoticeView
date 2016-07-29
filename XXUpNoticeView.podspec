
Pod::Spec.new do |s|
s.name             = "XXUpNoticeView"
s.version          = "1.0.0"
s.summary          = "仿照手机淘宝头条写的提示view 搜房网的搜房指南的提示view 扩展很方便 可以完全实现自定义 灵感来自市面上很多的轮播图"
s.description      = <<-DESC
It is a marquee view used on iOS, which implement by Objective-C.
DESC
s.homepage         = "https://github.com/xuxueing/XXUpNoticeView"
# s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
s.license          = 'MIT'
s.author             = { "朱小亮" => "330578304@qq.com" }
s.source       = { :git => "https://github.com/xuxueing/XXUpNoticeView.git", :tag => "1.0.0" }
# s.social_media_url = 'https://twitter.com/NAME'

s.platform     = :ios, '4.3'
# s.ios.deployment_target = '5.0'
# s.osx.deployment_target = '10.7'
s.requires_arc = true

s.source_files = 'XXUpNoticeView/*'
# s.resources = 'Assets'

# s.ios.exclude_files = 'Classes/osx'
# s.osx.exclude_files = 'Classes/ios'
# s.public_header_files = 'Classes/**/*.h'
s.frameworks = 'Foundation','UIKit'

end