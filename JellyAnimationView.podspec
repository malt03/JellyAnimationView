#
# Be sure to run `pod lib lint JellyAnimationView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JellyAnimationView'
  s.version          = '0.3.1'
  s.summary          = 'Animation like jelly.'

  s.description      = <<-DESC
You can animate a view like jelly.
                       DESC

  s.homepage         = 'https://github.com/malt03/JellyAnimationView'
  s.screenshots      = 'https://github.com/malt03/JellyAnimationView/blob/master/screenshot.gif?raw=true'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Koji Murata' => 'malt.koji@gmail.com' }
  s.source           = { :git => 'https://github.com/malt03/JellyAnimationView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'JellyAnimationView/Classes/**/*'
end
