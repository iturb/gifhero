import Foundation

class GifStrategyStand:GifStrategy
{
    override func changeSize()
    {
        super.changeSize()
        
        view.strategyLoadAndPause()
    }
}
