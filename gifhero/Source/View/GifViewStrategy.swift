import Foundation

extension GifView
{
    func strategyStand()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.syncStrategyStand()
        }
    }
    
    func strategyLoadAndAnimate()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
                
            self?.syncStrategyLoadAndAnimate()
        }
    }
    
    func strategyLoadAndPause()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.syncStrategyLoadAndPause()
        }
    }
    
    func strategyAnimate()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.syncStrategyAnimate()
        }
    }
    
    func strategyPause()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.syncStrategyPause()
        }
    }
    
    func syncStrategyStand()
    {
        strategy = GifStrategyStand(view:self)
    }
    
    //MARK: private
    
    private func syncStrategyLoadAndAnimate()
    {
        strategy = GifStrategyLoad(
            view:self,
            animateWhenReady:true)
    }
    
    private func syncStrategyLoadAndPause()
    {
        strategy = GifStrategyLoad(
            view:self,
            animateWhenReady:false)
    }
    
    private func syncStrategyAnimate()
    {
        strategy = GifStrategyAnimate(view:self)
    }
    
    private func syncStrategyPause()
    {
        strategy = GifStrategyPause(view:self)
    }
}
