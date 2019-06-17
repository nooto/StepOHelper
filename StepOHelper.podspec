#
#  Be sure to run `pod spec lint GKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "StepOHelper"
  spec.version      = "0.1.0"
  spec.summary      = "A kit for wokre of StepOHelper"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
#  spec.description  = <<-DESC
 #                  DESC
spec.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC


  spec.homepage     = "https://github.com/nooto/StepOHelper"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See https://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  #spec.license      = "MIT (example)"
   spec.license      = { :type => "MIT", :file => "LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  spec.author             = { " StepO" => "gaogao323@126.com" }
  # spec.social_media_url   = "https://twitter.com/"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

#   spec.platform     = :ios
   spec.platform     = :ios, "9.0"
   
   spec.ios.deployment_target = '9.0'

  #  When using multiple platforms
#   spec.ios.deployment_target = "5.0"
  # spec.osx.deployment_target = "10.7"
  # spec.watchos.deployment_target = "2.0"
  # spec.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  spec.source       = { :git => 'https://github.com/nooto/StepOHelper.git', :tag => spec.version }

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

#  spec.source_files  = 'GKit/CustomAlertManager/*.{h,m}'
#spec.source_files  = 'StepOHelper/*.{h,m}'
spec.source_files  = 'StepOHelper/**/*.{h,m}'
#     s.source_files = 'SmartHome/Classes/**/*.{h,m,mm}'
#  spec.source_files = 'Classes/**/*.{h,m}'
#  spec.source_files = 'Classes/**/*.{h,m}', 'More_Classes/**/*.{h,m}'

#  spec.exclude_files = 'GKit/'

#   spec.public_header_files = "StepOHelper/*.h"

#  spec.subspec 'SOMacroDefine' do |macroDefine|
#    macroDefine.source_files = 'StepOHelper/SOMacroDefine/*.{h,m}'
#  end
#
# spec.subspec 'SOUILabel' do |label|
#   label.source_files = 'StepOHelper/SOUILabel/*.{h,m}'
#   end
#
# spec.subspec 'SOUIButton' do |button|
#   button.source_files = 'StepOHelper/SOUIButton/*.{h,m}'
#   end
#
# spec.subspec 'NSString' do |string|
#   string.source_files = 'StepOHelper/SONSString/*.{h,m}'
# end
# 
# spec.subspec 'SOCategory' do |category|
#   category.source_files = 'StepOHelper/SOCategory/*.{h,m}'
# end
# 
#
#  spec.subspec 'SOAlertView' do |alertView|
#    alertView.source_files = 'StepOHelper/SOAlertView/*.{h,m}'
#    alertView.subspec 'SOCustomerAlertView' do |customerAlertView|
#      customerAlertView.source_files = 'StepOHelper/SOAlertView/SOCustomerAlertView/*.{h,m}'
#    end
#  end

  
  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  spec.frameworks = "Foundation", "UIKit"
  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

   spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"
  spec.pod_target_xcconfig = { "HEADER_SEARCH_PATHS" => '"${PODS_ROOT}/*"'}

 spec.dependency 'Masonry'
 spec.dependency 'YYKit'

end
