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
    
    var url:URL?
    {
        didSet
        {
            clearModel()
        }
    }
    
    var gifNamed:String?
    {
        didSet
        {
            clearModel()
        }
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
}
