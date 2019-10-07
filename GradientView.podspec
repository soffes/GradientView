Pod::Spec.new do |spec|
  spec.name = 'GradientView'
  spec.version = '5.0.0'
  spec.authors = {'Sam Soffes' => 'sam@soff.es'}
  spec.homepage = 'https://github.com/soffes/GradientView'
  spec.summary = 'Easily use gradients in UIKit.'
  spec.description = 'Gradient View is a simple UIView wrapper around CGGradient.'
  spec.source = {:git => 'https://github.com/soffes/GradientView.git', :tag => "v#{spec.version}"}
  spec.license = { :type => 'MIT', :file => 'LICENSE' }

  spec.ios.deployment_target = '8.0'
  spec.tvos.deployment_target = '9.0'

  spec.frameworks = 'UIKit'
  spec.source_files = 'GradientView/**/*.{h,m,swift}'
end
