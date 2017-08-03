import Foundation

class GifStrategyLoad:GifStrategy
{
    private let modelLoader:GifModelLoader
    private var animateWhenReady:Bool
    
    init(view:GifView, animateWhenReady:Bool)
    {
        self.animateWhenReady = animateWhenReady
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
        
        if animateWhenReady
        {
            view?.strategyLoadAndAnimate()
        }
        else
        {
            view?.strategyLoadAndPause()
        }
    }
    
    override func changeSize()
    {
        super.changeSize()
        
        if animateWhenReady
        {
            view?.strategyLoadAndAnimate()
        }
        else
        {
            view?.strategyLoadAndPause()
        }
    }
    
    override func startAnimating()
    {
        super.startAnimating()
        
        animateWhenReady = true
    }
    
    override func stopAnimating()
    {
        super.stopAnimating()
        
        animateWhenReady = false
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
        
        if animateWhenReady
        {
            view?.strategyAnimate()
        }
        else
        {
            view?.strategyPause()
        }
    }
}
