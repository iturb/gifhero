import UIKit

class GifView:UIView
{
    weak var displayLink:CADisplayLink?
    var model:GifModel?
    var strategy:GifStrategy?
    var renderMode:GifView.RenderMode
    
    init()
    {
        renderMode = GifView.RenderMode.betterQuality
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        contentMode = UIViewContentMode.scaleAspectFill

        syncStrategyStand()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    deinit
    {
        displayLink?.invalidate()
    }
    
    var url:URL?
    {
        didSet
        {
            DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
            { [weak strategy] in
                
                strategy?.changeSource()
            }
        }
    }
    
    var gifNamed:String?
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
