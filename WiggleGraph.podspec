Pod::Spec.new do |s|
  s.name         = "WiggleGraph"
  s.version      = "1.0.0"
  s.summary      = "Something like Dark Skies wiggly graph."
  s.homepage     = "https://github.com/kevinj04/WiggleGraph.git"
  s.license      = { :type => 'WTFPL', :file => 'license.txt' }
  s.author       = { "Kevin Jenkins" => "kevinj04@gmail.com" }
  s.source       = { :git => "https://github.com/kevinj04/WiggleGraph.git", :tag => "1.0.0" }
  s.platform     = :ios, '5.0'
  s.source_files = 'WiggleGraph/**/*.{h,m}'
  s.requires_arc = true
end