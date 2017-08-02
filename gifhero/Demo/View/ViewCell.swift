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
    
    //MARK: public
    
    func config(model:ModelProtocol)
    {
        self.gifView?.removeFromSuperview()
        
        let gifView:GifView = model.factoryGif()
        gifView.frame = bounds
        self.gifView = gifView
        
        addSubview(gifView)
    }
}
