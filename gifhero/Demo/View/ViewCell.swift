import UIKit

class ViewCell:UICollectionViewCell
{
    private weak var gifView:GifView?
    private let kHighlightedAlpha:CGFloat = 0.2
    private let kNotHighlightedAlpha:CGFloat = 1
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override var isSelected:Bool
    {
        didSet
        {
            checkSelected()
        }
    }
    
    override var isHighlighted:Bool
    {
        didSet
        {
            checkHighlighted()
        }
    }
    
    //MARK: private
    
    private func checkSelected()
    {
        if isSelected
        {
            gifView?.animating = true
        }
        else
        {
            gifView?.animating = false
        }
    }
    
    private func checkHighlighted()
    {
        if isHighlighted
        {
            alpha = kHighlightedAlpha
        }
        else
        {
            alpha = kNotHighlightedAlpha
        }
    }
    
    //MARK: internal
    
    func config(model:ModelProtocol)
    {
        self.gifView?.removeFromSuperview()
        
        let gifView:GifView = model.factoryGif()
        gifView.translatesAutoresizingMaskIntoConstraints = true
        gifView.frame = bounds
        self.gifView = gifView
        
        addSubview(gifView)
        
        checkSelected()
        checkHighlighted()
    }
}
