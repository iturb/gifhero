import Foundation

class GifModelLoader
{
    private weak var strategy:GifStrategyLoad?
    
    //MARK: public
    
    func load(strategy:GifStrategyLoad)
    {
        self.strategy = strategy
    }
}
