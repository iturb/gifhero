import Foundation

class GifModel
{
    private let frames:[GifModelFrame]
    private let count:Int
    private var index:Int
    
    init(frames:[GifModelFrame])
    {
        self.frames = frames
        count = frames.count
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
    
    func update(view:GifView, timestamp:TimeInterval)
    {
        guard
            
            let frame:GifModelFrame = currentFrame()
            
        else
        {
            return
        }
        
        let shouldChange:Bool = frame.shouldChange(currentTimestamp:timestamp)
        
        if shouldChange
        {
            nextFrame()
            
            guard
                
                let newFrame:GifModelFrame = currentFrame()
                
            else
            {
                return
            }
            
            newFrame.timestamp = timestamp
        }
        
        view.setNeedsDisplay()
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
