Pod::Spec.new do |s|
    s.name             = 'GifHero'
    s.version          = '1.0.2'
    s.summary          = 'Superb GIF animation renderer'
    s.description      = <<-DESC
                                GIF images with animation on iOS.
                                Performance, memory usage and energy
                                optimised and easy to use.
                            DESC
    s.homepage         = 'https://github.com/iturb/gifhero'
    s.license          = { :type => "MIT", :file => "LICENSE" }
    s.author           = { 'iturbide' => 'reach@iturbi.de' }
    s.platform         = :ios, '9.0'
    s.source           = { :git => 'https://github.com/iturb/gifhero.git', :tag => "v#{s.version}" }
    s.source_files     = 'gifhero/Source/**/*.swift'
end
