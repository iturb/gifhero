import Foundation

class GifModelLoader
{
    private weak var strategy:GifStrategyLoad?
    
    //MARK: private
    
    private func loadForView(view:GifView)
    {
        let gifUrl:URL?
        
        if let url:URL = view.url
        {
            gifUrl = url
        }
        else
        {
            
        }
    }
    
    //MARK: public
    
    func load(strategy:GifStrategyLoad)
    {
        self.strategy = strategy
        
        let queue:DispatchQueue = GifModelLoader.factoryQueue()
        
        queue.async
        { [weak strategy, weak self] in
                
            guard
            
                let view:GifView = strategy?.view
            
            else
            {
                strategy?.loadFail()
                
                return
            }
            
            self?.loadForView(view:view)
        }
    }
}
