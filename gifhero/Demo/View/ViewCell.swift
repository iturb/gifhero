import UIKit

class ViewCell:UICollectionViewCell
{
    private weak var gifView:GifView?
    
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
            hover()
        }
    }
    
    override var isHighlighted:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    //MARK: private
    
    func hover()
    {
        if isSelected || isHighlighted
        {
            gifView?.startAnimation()
        }
        else
        {
            gifView?.stopAnimation()
        }
    }
    
    //MARK: public
    
    func config(model:ModelProtocol)
    {
        self.gifView?.removeFromSuperview()
        
        let gifView:GifView = model.factoryGif()
        gifView.translatesAutoresizingMaskIntoConstraints = true
        gifView.frame = bounds
        self.gifView = gifView
        
        addSubview(gifView)
        
        hover()
    }
}
