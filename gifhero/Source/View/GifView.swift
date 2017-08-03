import UIKit

open class GifView:UIView
{
    weak var displayLink:CADisplayLink?
    weak var imageView:UIImageView!
    var model:GifModel?
    var strategy:GifStrategy?
    
    public init()
    {
        animating = false
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        contentMode = UIViewContentMode.scaleAspectFill
        
        factoryImage()
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
    
    open var animating:Bool
    {
        didSet
        {
            DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
            { [weak strategy] in
                
                strategy?.animationChange()
            }
        }
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
