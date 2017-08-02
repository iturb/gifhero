import Foundation

class GifStrategyLoad:GifStrategy
{
    private var animateWhenReady:Bool
    
    init(view:GifView, animateWhenReady:Bool)
    {
        self.animateWhenReady = animateWhenReady
        
        super.init(view:view)
    }
    
    override func changeSource()
    {
        super.changeSource()
        
        if animateWhenReady
        {
            view.strategyLoadAndAnimate()
        }
        else
        {
            view.strategyLoadAndPause()
        }
    }
    
    override func changeSize()
    {
        super.changeSize()
        
        if animateWhenReady
        {
            view.strategyLoadAndAnimate()
        }
        else
        {
            view.strategyLoadAndPause()
        }
    }
}
