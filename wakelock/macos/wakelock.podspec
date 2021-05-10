#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'wakelock'
  s.version          = '0.0.1'
  s.summary          = 'No-op implementation of the macos wakelock plugin to avoid build issues on macos'
  s.description      = <<-DESC
  No-op implementation of the wakelock plugin to avoid build issues on macos.
  https://github.com/flutter/flutter/issues/46618
                       DESC
  s.homepage         = 'https://github.com/creativecreatorormaybenot/wakelock'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'creativecreatorormaybenot' => 'creativecreatorormaybenot@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'

  s.platform = :osx
  s.osx.deployment_target = '10.11'
end
