Pod::Spec.new do |spec|
  spec.name = 'GradientView'
  spec.version = '2.3.4'
  spec.authors = {'Sam Soffes' => 'sam@soff.es'}
  spec.homepage = 'https://github.com/soffes/GradientView'
  spec.summary = 'Easily use gradients in UIKit.'
  spec.description = 'Gradient View is a simple UIView wrapper around CGGradient.'
  spec.source = {:git => 'https://github.com/soffes/GradientView.git', :tag => "v#{spec.version}"}
  spec.license = { :type => 'MIT', :file => 'LICENSE' }

  spec.swift_versions = ['5.0', '5.2']
  spec.ios.deployment_target = '8.0'
  spec.tvos.deployment_target = '9.0'

  spec.frameworks = 'UIKit'
  spec.source_files = 'Sources/GradientView/**/*.swift'
end
