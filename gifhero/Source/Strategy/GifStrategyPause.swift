import Foundation

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
        
        view?.strategyLoadAndPause()
    }
    
    override func changeSize()
    {
        super.changeSize()
        
        view?.strategyLoadAndPause()
    }
    
    override func startAnimating()
    {
        super.startAnimating()
        
        view?.strategyAnimate()
    }
    
    //MARK: private
    
    private func dispatchDisplay()
    {
        view?.displayLink?.isPaused = true
        view?.updateFrame()
    }
}
