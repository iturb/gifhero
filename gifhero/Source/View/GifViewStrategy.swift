import Foundation

extension GifView
{
    func strategyStand()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncStrategyStand()
        }
    }
    
    func strategyLoadAndAnimate()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
                
            self?.asyncStrategyLoadAndAnimate()
        }
    }
    
    func strategyLoadAndPause()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncStrategyLoadAndPause()
        }
    }
    
    func strategyAnimate()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncStrategyAnimate()
        }
    }
    
    func strategyPause()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncStrategyPause()
        }
    }
    
    //MARK: private
    
    private func asyncStrategyStand()
    {
        strategy = GifStrategyStand(view:self)
    }
    
    private func asyncStrategyLoadAndAnimate()
    {
        strategy = GifStrategyLoad(
            view:self,
            animateWhenReady:true)
    }
    
    private func asyncStrategyLoadAndPause()
    {
        strategy = GifStrategyLoad(
            view:self,
            animateWhenReady:false)
    }
    
    private func asyncStrategyAnimate()
    {
        strategy = GifStrategyAnimate(view:self)
    }
    
    private func asyncStrategyPause()
    {
        strategy = GifStrategyPause(view:self)
    }
}
