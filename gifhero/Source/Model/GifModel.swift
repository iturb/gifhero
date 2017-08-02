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
    
    //MARK: public
    
    func update(view:GifView, timestamp:TimeInterval)
    {
        
    }
}
