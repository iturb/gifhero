import UIKit

class GifView:UIView
{
    private var model:GifModel?
    private weak var displayLink:CADisplayLink?
    
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        contentMode = UIViewContentMode.scaleAspectFill
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    deinit
    {
        displayLink?.invalidate()
    }
    
    override func removeFromSuperview()
    {
        super.removeFromSuperview()
        
        displayLink?.invalidate()
    }
    
    override func layoutSubviews()
    {
        clearModel()
        
        super.layoutSubviews()
    }
    
    override var contentMode:UIViewContentMode
    {
        didSet
        {
            clearModel()
        }
    }
    
    override var frame:CGRect
    {
        didSet
        {
            clearModel()
        }
    }
    
    override var bounds:CGRect
    {
        didSet
        {
            clearModel()
        }
    }
    
    //MARK: selectors
    
    func selectorUpdateDisplayLink(
        sender displayLink:CADisplayLink)
    {
    }
    
    //MARK: private
    
    private func clearModel()
    {
        model = nil
    }
    
    //MARK: public
}
