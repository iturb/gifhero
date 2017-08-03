import Foundation

class GifStrategyLoad:GifStrategy
{
    private let modelLoader:GifModelLoader
    
    override init(view:GifView)
    {
        modelLoader = GifModelLoader()
        
        super.init(view:view)
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.dispatchLoad()
        }
    }
    
    override func changeSource()
    {
        super.changeSource()
        
        view?.strategyLoad()
    }
    
    override func changeSize()
    {
        super.changeSize()
        
        view?.strategyLoad()
    }
    
    //MARK: private
    
    private func dispatchLoad()
    {
        modelLoader.load(strategy:self)
    }
    
    //MARK: public
    
    func loadFail()
    {
        view?.strategyStand()
    }
    
    func loadSuccess(model:GifModel)
    {
        view?.factoryDisplayLink(model:model)
    }
}
