import UIKit

class View:UIView
{
    private(set) weak var collectionView:UICollectionView!
    
    init()
    {
        super.init(frame:CGRect.zero)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
