import Foundation

class GifStrategyPause:GifStrategy
{
    override func changeSource()
    {
        super.changeSource()
        
        view.strategyLoadAndPause()
    }
    
    override func changeSize()
    {
        super.changeSize()
        
        view.strategyLoadAndPause()
    }
    
    override func draw()
    {
        super.draw()
    }
    
    override func startAnimating()
    {
        super.startAnimating()
        
        view.strategyAnimate()
    }
}
