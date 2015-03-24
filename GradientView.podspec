Pod::Spec.new do |s|
  s.name        = "GradientView"
  s.version     = "0.0.1"
  s.summary     = "Easily use gradients in UIKit. Gradient View is a simple UIView wrapper around CGGradient.

"
  s.homepage    = "https://github.com/soffes/GradientView"
  s.license     = { :type => "MIT" }
  s.authors     = { "Sam Soffes" => "sam@soff.es" }

  s.requires_arc = true
  s.ios.deployment_target = "8.0"
  s.source   = { :git => "https://github.com/liujuncheng/GradientView.git", :tag => "v0.0.1"}
  s.source_files = "GradientView/*.swift"
end
