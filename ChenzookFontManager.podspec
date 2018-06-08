#
# Be sure to run `pod lib lint ChenzookFontManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'ChenzookFontManager'
    s.version          = '0.3.0'
    s.summary          = 'Overriding entire application font by just single line of code'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = <<-DESC
    With Chenzook Font Manager (by Seyed Mojtaba Hosseini Zeidabadi), you can specify a custom font for each system support font traits from ultraLight to Black (+ Oblique).
    DESC
    
    s.homepage         = 'https://github.com/Chenzook/FontManager'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = 'MIT'
    s.author           = { 'MojtabaHs' => 'hosseini@chenzook.com' }
    s.source           = { :git => 'https://github.com/Chenzook/FontManager.git', :tag => s.version.to_s }
    s.social_media_url = 'https://linkedin.com/in/MojtabaHosseini'
    
    s.ios.deployment_target = '8.0'
    s.swift_version = '4.1'
    
    s.source_files = 'ChenzookFontManager/Classes/**/*'
    
    # s.resource_bundles = {
    #   'ChenzookFontManager' => ['ChenzookFontManager/Assets/*.png']
    # }
    
    # s.public_header_files = 'Pod/Classes/**/*.h'
    # s.frameworks = 'UIKit', 'MapKit'
    # s.dependency 'AFNetworking', '~> 2.3'
end
