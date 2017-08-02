import UIKit

class GifModelFrame
{
    let image:CGImage
    let duration:TimeInterval
    var timestamp:TimeInterval
    
    init(image:CGImage, duration:TimeInterval)
    {
        self.image = image
        self.duration = duration
        timestamp = 0
    }
    
    //MARK: public
    
    func expectChange() -> TimeInterval
    {
        let sum:TimeInterval = duration + timestamp
        
        return sum
    }
}
