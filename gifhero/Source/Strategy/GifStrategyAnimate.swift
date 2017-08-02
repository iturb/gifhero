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
    
    override func draw()
    {
        super.draw()
    }
    
    override func stopAnimating()
    {
        super.stopAnimating()
        
        view.strategyPause()
    }
}
