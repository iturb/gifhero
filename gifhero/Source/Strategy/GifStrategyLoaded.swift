import Foundation

class GifStrategyLoaded:GifStrategy
{
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
        if model.index < model.count - 1
        {
            model.index += 1
        }
        else
        {
            model.index = 0
        }
        
        guard
            
            let newFrame:GifModelFrame = model.currentFrame()
            
        else
        {
            return
        }
        
        newFrame.updateTime(
            timestamp:timestamp,
            delta:delta)
    }
}
