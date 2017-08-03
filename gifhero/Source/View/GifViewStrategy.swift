import Foundation

extension GifView
{
    func strategyStand()
    {
        strategy = GifStrategyStand(view:self)
    }
    
    func strategyLoad()
    {
        strategy = GifStrategyLoad(view:self)
    }
    
    func strategyLoaded()
    {
        strategy = GifStrategyLoaded(view:self)
    }
}
