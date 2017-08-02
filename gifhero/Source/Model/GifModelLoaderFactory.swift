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
    
    class func sourceUrlFor(view:GifView) -> URL?
    {
        let gifUrl:URL?
        
        if let url:URL = view.url
        {
            gifUrl = url
        }
        else if let gifNamed:String = view.gifNamed
        {
            gifUrl = factoryUrlFrom(
                gifNamed:gifNamed)
        }
        else
        {
            gifUrl = nil
        }
        
        return gifUrl
    }
    
    //MARK: private
    
    private class func factoryUrlFrom(gifNamed:String) -> URL?
    {
        let url:URL? = Bundle.main.url(
            forResource:gifNamed,
            withExtension:nil)
        
        return url
    }
}
