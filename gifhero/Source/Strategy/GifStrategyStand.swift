import Foundation

class GifStrategyStand:GifStrategy
{    
    override func preLoad()
    {
        super.preLoad()
        
        view.strategyLoadAndPause()
    }
    
    override func draw()
    {
        super.draw()
        
        view.strategyLoadAndPause()
    }
    
    override func startAnimating()
    {
        super.startAnimating()
        
        view.strategyLoadAndAnimate()
    }
    
    override func stopAnimating()
    {
        super.stopAnimating()
        
        view.strategyLoadAndPause()
    }
}
