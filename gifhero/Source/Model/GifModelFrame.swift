import UIKit

class GifModelFrame
{
    let image:UIImage
    private let duration:TimeInterval
    private var sum:TimeInterval
    
    init(image:UIImage, duration:TimeInterval)
    {
        self.image = image
        self.duration = duration
        sum = 0
    }
    
    //MARK: internal
    
    func deltaTime(currentTimestamp:TimeInterval) -> TimeInterval
    {
        let delta:TimeInterval = currentTimestamp - sum
        
        return delta
    }
    
    func updateTime(timestamp:TimeInterval, delta:TimeInterval)
    {
        let time:TimeInterval
        
        if delta > 1
        {
            time = timestamp
        }
        else
        {
            time = timestamp - delta
        }
        
        sum = duration + time
    }
}
