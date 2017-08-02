import Foundation

class GifStrategyStand:GifStrategy
{
    override func changeSize()
    {
        super.changeSize()
        
        view.strategyLoadAndPause()
    }
    
    override func preLoad()
    {
        super.preLoad()
        
        view.strategyLoadAndPause()
    }
}
