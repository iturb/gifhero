import Foundation

class GifStrategyAnimate:GifStrategy
{
    override func changeSource()
    {
        super.changeSource()
        
        view.strategyLoadAndAnimate()
    }
}
