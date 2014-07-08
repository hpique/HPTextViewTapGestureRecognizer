Pod::Spec.new do |s|
  s.name         = "HPTextViewTapGestureRecognizer"
  s.version      = "0.1"
  s.summary      = "The simplest way to handle links and interactive attachments in UITextView."
  s.homepage     = "https://github.com/hpique/HPTextViewTapGestureRecognizer"
  s.license      = { :type => 'Apache 2.0', :file => 'LICENSE' }
  s.author       = { "Hermes Pique" => "@hpique" }
  s.social_media_url = 'https://twitter.com/hpique'
  s.ios.deployment_target = '7.0'
  s.source       = { :git => "https://github.com/hpique/HPTextViewTapGestureRecognizer.git", :tag => "v#{s.version}" }
  s.source_files  = 'HPTextViewTapGestureRecognizer/*.{h,m}'
  s.requires_arc = true;
end