import Foundation

class GifStrategyStand:GifStrategy
{
    override func changeSize()
    {
        super.changeSize()
        
        view?.strategyLoad()
    }
    
    override func animationChange()
    {
        super.animationChange()
        
        view?.strategyLoad()
    }
}
