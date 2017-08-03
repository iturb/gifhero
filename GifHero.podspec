Pod::Spec.new do |s|
    s.name             = 'GifHero'
    s.version          = '0.0.1'
    s.summary          = 'GIF support'
    s.description      = <<-DESC
                                GIF images with animation on iOS.
                                Performance and memory usage and energy
                                optimised and completely transparent to use.
                            DESC
    s.homepage         = 'https://github.com/iturb/gifhero'
    s.license          = { :type => "MIT", :file => "LICENSE" }
    s.author           = { 'iturbide' => 'reach@iturbi.de' }
    s.source           = { :git => 'https://github.com/iturb/gifhero.git', :tag => "v#{spec.version}" }
    s.source_files     = 'gifhero/Source/**/*.swift'
end
