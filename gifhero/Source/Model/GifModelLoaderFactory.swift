import Foundation

extension GifModelLoader
{
    private static let kQueueLabel:String = "iturbide.gifhero"
    
    class func factoryQueue() -> DispatchQueue
    {
        let queue = DispatchQueue(
            label:kQueueLabel,
            qos:DispatchQoS.background,
            attributes:DispatchQueue.Attributes(),
            autoreleaseFrequency:DispatchQueue.AutoreleaseFrequency.inherit,
            target:DispatchQueue.global(qos:DispatchQoS.QoSClass.background))
        
        return queue
    }
}
