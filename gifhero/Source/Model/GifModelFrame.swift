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
    
    func shouldChange(currentTimestamp:TimeInterval) -> Bool
    {
        let sum:TimeInterval = duration + timestamp
        
        return currentTimestamp > sum
    }
}
