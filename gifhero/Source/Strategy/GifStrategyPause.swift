import UIKit

class GifStrategyPause:GifStrategy
{
    override init(view:GifView)
    {
        super.init(view:view)
        
        view.displayLink?.isPaused = true
        view.asyncNeedsDisplay()
    }
    
    override func changeSource()
    {
        super.changeSource()
        
        view.strategyLoadAndPause()
    }
    
    override func changeSize()
    {
        super.changeSize()
        
        view.strategyLoadAndPause()
    }
    
    override func draw(rect:CGRect)
    {
        super.draw(rect:rect)
        
        drawCurrentFrame(rect:rect)
    }
    
    override func startAnimating()
    {
        super.startAnimating()
        
        view.strategyAnimate()
    }
}
