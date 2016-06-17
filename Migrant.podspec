#
#  Be sure to run `pod spec lint Migrant.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "Migrant"
  s.version      = "0.0.1"
  s.summary      = "Migrant is migration framework."
  s.description  = <<-DESC
                   DESC
  s.homepage     = "http://github.com/tomoponzoo/Migrant"
  s.license      = "MIT"
  s.author       = { "tomoponzoo" => "tomoponzoo@gmail.com" }

  s.ios.deployment_target = "8.0"

  s.source       = { :git => "http://github.com/tomoponzoo/Migrant.git", :tag => "#{s.version}" }
  s.source_files = "Migrant/*.swift", "Migrant/**/*.swift"
  s.requires_arc = true
end
