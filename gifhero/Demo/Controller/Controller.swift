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
    
    //MARK: private
    
    private func modelAtIndex(index:IndexPath) -> ModelProtocol
    {
        let item:ModelProtocol = model.items[index.item]
        
        return item
    }
    
    //MARK: collectionView delegate/datasource
    
    func numberOfSections(
        in collectionView:UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        numberOfItemsInSection section:Int) -> Int
    {
        let count:Int = model.items.count
        
        return count
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:ModelProtocol = modelAtIndex(index:indexPath)
        let cell:ViewCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:
            kReusableIdentifier,
            for:indexPath) as! ViewCell
        cell.config(model:item)
        
        return cell
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        shouldSelectItemAt indexPath:IndexPath) -> Bool
    {
        guard
            
            let cell:UICollectionViewCell = collectionView.cellForItem(
                at:indexPath)
            
        else
        {
            return false
        }
        
        if cell.isSelected
        {
            collectionView.deselectItem(
                at:indexPath,
                animated:true)
            
            return false
        }
        
        return true
    }
}
