import UIKit

class Controller:
    UIViewController,
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout
{
    private let kReusableIdentifier:String = "viewCell"
    
    override func loadView()
    {
        let view:View = View()
        view.collectionView.delegate = self
        view.collectionView.dataSource = self
        view.collectionView.register(
            ViewCell.self,
            forCellWithReuseIdentifier:
            kReusableIdentifier)
        self.view = view
    }
}
