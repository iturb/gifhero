import Foundation

class GifModel
{
    private var frames:[GifModelFrame]
    private var count:Int
    private var index:Int
    
    init()
    {
        frames = []
        count = 0
        index = 0
    }
    
    //MARK: private
    
    private func nextFrame()
    {
        if index < count - 1
        {
            index += 1
        }
        else
        {
            index = 0
        }
    }
    
    //MARK: public
    
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
            nextFrame()
            
            guard
                
                let newFrame:GifModelFrame = currentFrame()
                
            else
            {
                return
            }
            
            newFrame.updateTime(
                timestamp:timestamp,
                delta:delta)
        }
        
        view.updateFrame()
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
