import Foundation

class GifStrategyLoad:GifStrategy
{
    private var animateWhenReady:Bool
    
    init(view:GifView, animateWhenReady:Bool)
    {
        self.animateWhenReady = animateWhenReady
        
        super.init(view:view)
    }
}
