import Foundation

class GifStrategyAnimate:GifStrategy
{
    override func changeSource()
    {
        super.changeSource()
        
        view.strategyLoadAndAnimate()
    }
    
    override func changeSize()
    {
        super.changeSize()
        
        view.strategyLoadAndAnimate()
    }
}
