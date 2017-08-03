import Foundation

extension GifView
{
    open func preLoad()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak strategy] in
            
            strategy?.preLoad()
        }
    }
    
    open func startAnimation()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak strategy] in
            
            strategy?.startAnimating()
        }
    }
    
    open func stopAnimation()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak strategy] in
        
            strategy?.stopAnimating()
        }
    }
}
