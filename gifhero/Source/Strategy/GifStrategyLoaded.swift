import Foundation

class GifStrategyLoaded:GifStrategy
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
        
        view?.strategyLoad()
    }
    
    override func changeSize()
    {
        super.changeSize()
        
        view?.strategyLoad()
    }
    
    override func animationChange()
    {
        super.animationChange()
        
        checkAnimation()
    }
    
    //MARK: private
    
    private func stopUpdate()
    {
        view?.displayLink?.isPaused = true
    }
    
    private func startUpdate()
    {
        view?.displayLink?.isPaused = false
    }
    
    private func dispatchDisplay()
    {
        checkAnimation()
        view?.updateFrame()
    }
    
    private func checkAnimation()
    {
        guard
            
            let view:GifView = self.view
            
        else
        {
            return
        }
        
        if view.animating
        {
            startUpdate()
        }
        else
        {
            stopUpdate()
        }
    }
}
