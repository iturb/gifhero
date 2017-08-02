import UIKit

class Controller:
    UIViewController,
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout
{
    let model:Model
    private let kReusableIdentifier:String = "viewCell"
    
    init()
    {
        model = Model()
        
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
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
