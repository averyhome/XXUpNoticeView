
Pod::Spec.new do |s|
s.name             = "XXUpNoticeView"
s.version          = "1.0.0"
s.summary          = "仿照手机淘宝头条写的提示view 搜房网的搜房指南的提示view 扩展很方便 可以完全实现自定义 灵感来自市面上很多的轮播图"
s.description      = <<-DESC
It is a marquee view used on iOS, which implement by Objective-C.
DESC
s.homepage         = "https://github.com/xuxueing/XXUpNoticeView"
# s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"

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


s.license          = { :type => 'Apache License, Version 2.0', :text => <<-LICENSE
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
LICENSE
}

end