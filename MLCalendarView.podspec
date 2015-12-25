Pod::Spec.new do |s|
  s.name         = "MLCalendarView"
  s.version      = "0.1"
  s.summary      = "Calendar component for OS X inspired by some free iOS alternatives."
  s.homepage     = "https://github.com/gyetvan-andras/Calendar-OSX"

  s.license      = 'MIT'
  s.author       = { "Gyetván András" => "gyetvan.andras@gmail.com" }

  s.platform     = :osx, '10.10'
  s.source       = { :git => "https://github.com/gyetvan-andras/Calendar-OSX.git", :tag => s.version }
  s.source_files = 'MLCalendarSample/ML*.{h,m}'
  s.resources    = 'MLCalendarSample/*.xib'
  s.requires_arc = true
end
