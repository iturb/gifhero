import Foundation

class GifStrategyStand:GifStrategy
{
    override func changeSize()
    {
        super.changeSize()
        
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
