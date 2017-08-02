import Foundation

class GifModel
{
    let frames:[GifModelFrame]
    let count:Int
    var index:Int
    
    init(frames:[GifModelFrame])
    {
        self.frames = frames
        count = frames.count
        index = 0
    }
}
