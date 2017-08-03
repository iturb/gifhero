import Foundation

class GifStrategyStand:GifStrategy
{
    override func render()
    {
        super.render()
        
        view?.strategyLoad()
    }
}
