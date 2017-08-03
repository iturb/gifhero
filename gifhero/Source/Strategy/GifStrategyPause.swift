import UIKit

class GifStrategyPause:GifStrategy
{
    override init(view:GifView)
    {
        super.init(view:view)
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.dispatchDisplay()
        }
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
    
    //MARK: private
    
    private func dispatchDisplay()
    {
        view.displayLink?.isPaused = true
        view.asyncNeedsDisplay()
    }
}
