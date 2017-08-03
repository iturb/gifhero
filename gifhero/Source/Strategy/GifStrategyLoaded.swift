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
    
    //MARK: private
    
    private func dispatchDisplay()
    {
        view?.updateFrame()
    }
}
