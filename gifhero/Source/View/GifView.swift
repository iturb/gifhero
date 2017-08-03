import UIKit

open class GifView:UIImageView
{
    weak var displayLink:CADisplayLink?
    var model:GifModel?
    var strategy:GifStrategy?
    
    public init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        contentMode = UIViewContentMode.scaleAspectFill
        
        strategyStand()
    }
    
    required public init?(coder:NSCoder)
    {
        return nil
    }
    
    deinit
    {
        displayLink?.invalidate()
    }
    
    open var url:URL?
    {
        didSet
        {
            DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
            { [weak strategy] in
                
                strategy?.changeSource()
            }
        }
    }
    
    open var gifNamed:String?
    {
        didSet
        {
            DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
            { [weak strategy] in
            
                strategy?.changeSource()
            }
        }
    }
}
