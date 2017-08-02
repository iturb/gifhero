import Foundation

class GifStrategyPause:GifStrategy
{
    override func changeSource()
    {
        super.changeSource()
        
        view.strategyLoadAndPause()
    }
}
