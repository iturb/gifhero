import UIKit

extension GifView
{
    override func removeFromSuperview()
    {
        super.removeFromSuperview()
        
        displayLink?.invalidate()
    }
    
    override func layoutSubviews()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak strategy] in
        
            strategy?.changeSize()
        }
        
        super.layoutSubviews()
    }
    
    override var contentMode:UIViewContentMode
    {
        didSet
        {
            DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
            { [weak strategy] in
            
                strategy?.changeSize()
            }
        }
    }
}
