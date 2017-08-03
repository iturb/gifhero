import UIKit

class View:UIView
{
    private(set) weak var collectionView:UICollectionView!
    private let kCollectionInterItemSpace:CGFloat = 10
    private let kCollectionMarginVertical:CGFloat = 30
    private let kCellHeight:CGFloat = 300
    
    init()
    {
        super.init(frame:CGRect.zero)
        backgroundColor = UIColor.white
        
        let screenBounds:CGRect = UIScreen.main.bounds
        let screenWidth:CGFloat = screenBounds.width
        
        let flow:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flow.scrollDirection = UICollectionViewScrollDirection.vertical
        flow.headerReferenceSize = CGSize.zero
        flow.footerReferenceSize = CGSize.zero
        flow.minimumLineSpacing = kCollectionInterItemSpace
        flow.minimumInteritemSpacing = kCollectionInterItemSpace
        flow.itemSize = CGSize(
            width:screenWidth,
            height:kCellHeight)
        flow.sectionInset = UIEdgeInsets(
            top:kCollectionMarginVertical,
            left:0,
            bottom:kCollectionMarginVertical,
            right:0)
        
        let collectionView:UICollectionView = UICollectionView(
            frame:screenBounds,
            collectionViewLayout:flow)
        collectionView.clipsToBounds = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsVerticalScrollIndicator = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceVertical = true
        collectionView.allowsMultipleSelection = false
        self.collectionView = collectionView
        
        addSubview(collectionView)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
