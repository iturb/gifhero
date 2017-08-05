import Foundation

class GifModel
{
    var index:Int
    private(set) var count:Int
    private var frames:[GifModelFrame]
    
    init()
    {
        frames = []
        count = 0
        index = 0
    }
    
    //MARK: internal
    
    func addFrame(frame:GifModelFrame)
    {
        frames.append(frame)
        count = frames.count
    }
    
    func update(view:GifView, timestamp:TimeInterval)
    {
        guard
            
            let frame:GifModelFrame = currentFrame()
            
        else
        {
            return
        }
        
        let delta:TimeInterval = frame.deltaTime(
            currentTimestamp:timestamp)
        
        if delta >= 0
        {
            view.strategy?.nextFrame(
                model:self,
                timestamp:timestamp,
                delta:delta)
            
            view.updateFrame()
        }
    }
    
    func currentFrame() -> GifModelFrame?
    {
        let frame:GifModelFrame?
        
        if index >= 0 && index < count
        {
            frame = frames[index]
        }
        else
        {
            frame = nil
        }
        
        return frame
    }
}
