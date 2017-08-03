import Foundation

extension GifView
{
    func strategyStand()
    {
        strategy = GifStrategyStand(view:self)
    }
    
    func strategyLoadAndAnimate()
    {
        strategy = GifStrategyLoad(
            view:self,
            animateWhenReady:true)
    }
    
    func strategyLoadAndPause()
    {
        strategy = GifStrategyLoad(
            view:self,
            animateWhenReady:false)
    }
    
    func strategyAnimate()
    {
        strategy = GifStrategyAnimate(view:self)
    }
    
    func strategyPause()
    {
        strategy = GifStrategyPause(view:self)
    }
}
