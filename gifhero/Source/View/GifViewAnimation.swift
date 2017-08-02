import Foundation

extension GifView
{
    func preLoad()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak strategy] in
            
            strategy?.preLoad()
        }
    }
    
    func startAnimation()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak strategy] in
            
            strategy?.startAnimating()
        }
    }
    
    func stopAnimation()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak strategy] in
        
            strategy?.stopAnimating()
        }
    }
}
