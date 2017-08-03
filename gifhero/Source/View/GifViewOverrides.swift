import UIKit

extension GifView
{
    override open func removeFromSuperview()
    {
        super.removeFromSuperview()
        
        displayLink?.invalidate()
    }
    
    override open func layoutSubviews()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak strategy] in
        
            strategy?.changeSize()
        }
        
        super.layoutSubviews()
    }
    
    override open var contentMode:UIViewContentMode
    {
        didSet
        {
            DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
            { [weak strategy] in
            
                strategy?.changeSize()
            }
        }
    }
    
    open override func draw(_ rect:CGRect)
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak strategy] in
                
            strategy?.render()
        }
    }
}
