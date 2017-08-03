import UIKit

class GifStrategyAnimate:GifStrategy
{
    override init(view:GifView)
    {
        super.init(view:view)
        
        view.displayLink?.isPaused = false
    }
    
    override func changeSource()
    {
        super.changeSource()
        
        view?.strategyLoadAndAnimate()
    }
    
    override func changeSize()
    {
        super.changeSize()
        
        view?.strategyLoadAndAnimate()
    }
    
    override func draw(rect:CGRect)
    {
        super.draw(rect:rect)
        
        drawCurrentFrame(rect:rect)
    }
    
    override func stopAnimating()
    {
        super.stopAnimating()
        
        view?.strategyPause()
    }
}
