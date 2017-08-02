import UIKit

class GifView:UIView
{
    weak var displayLink:CADisplayLink?
    var model:GifModel?
    var strategy:GifStrategy?
    
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        contentMode = UIViewContentMode.scaleAspectFill

        strategyStand()
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
            strategy?.changeSource()
        }
    }
    
    var gifNamed:String?
    {
        didSet
        {
            strategy?.changeSource()
        }
    }
    
    //MARK: selectors
    
    func selectorUpdateDisplayLink(
        sender displayLink:CADisplayLink)
    {
    }
}
