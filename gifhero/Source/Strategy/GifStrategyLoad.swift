import Foundation

class GifStrategyLoad:GifStrategy
{
    private let modelLoader:GifModelLoader
    
    override init(view:GifView)
    {
        modelLoader = GifModelLoader()
        
        super.init(view:view)
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.dispatchLoad()
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
    
    override func nextFrame(
        model:GifModel,
        timestamp:TimeInterval,
        delta:TimeInterval)
    {
        let useDelta:TimeInterval
        
        if model.index < model.count - 1
        {
            useDelta = delta
            model.index += 1
        }
        else
        {
            useDelta = 0
        }
        
        guard
            
            let newFrame:GifModelFrame = model.currentFrame()
            
        else
        {
            return
        }
        
        newFrame.updateTime(
            timestamp:timestamp,
            delta:useDelta)
    }
    
    //MARK: private
    
    private func dispatchLoad()
    {
        modelLoader.load(strategy:self)
    }
    
    //MARK: internal
    
    func loadFail()
    {
        view?.strategyStand()
    }
}
