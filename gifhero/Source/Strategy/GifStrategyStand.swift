import UIKit

class GifStrategyStand:GifStrategy
{    
    override func preLoad()
    {
        super.preLoad()
        
        view?.strategyLoadAndPause()
    }
    
    override func draw(rect:CGRect)
    {
        super.draw(rect:rect)
        
        view?.strategyLoadAndPause()
    }
    
    override func startAnimating()
    {
        super.startAnimating()
        
        view?.strategyLoadAndAnimate()
    }
    
    override func stopAnimating()
    {
        super.stopAnimating()
        
        view?.strategyLoadAndPause()
    }
}
