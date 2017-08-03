import Foundation
import ImageIO

extension CGImageSource
{
    open class func factorySource(url:URL) -> CGImageSource?
    {
        guard
            
            let data:CFData = loadData(url:url)
            
        else
        {
            return nil
        }
        
        let options:CFDictionary = optionsNoCache()
        
        guard
            
            let source:CGImageSource = CGImageSourceCreateWithData(
                data,
                options)
            
        else
        {
            return nil
        }
        
        return source
    }
    
    open class func optionsNoCache() -> CFDictionary
    {
        let dictionary:[String:Any] = [
            kCGImageSourceShouldCache as String:kCFBooleanFalse]
        let cfDictionary:CFDictionary = dictionary as CFDictionary
        
        return cfDictionary
    }
    
    open func frameImageAt(
        index:Int,
        options:CFDictionary) -> CGImage?
    {
        guard
            
            let image:CGImage = CGImageSourceCreateImageAtIndex(
                self,
                index,
                options)
            
        else
        {
            return nil
        }
        
        return image
    }
    
    open func frameDurationAt(index:Int) -> TimeInterval?
    {
        guard
            
            let properties:[String:AnyObject] = framePropertiesAt(
                index:index),
            let gifProperties:[String:AnyObject] = properties[
                kCGImagePropertyGIFDictionary as String] as? [String:AnyObject],
            let delayTime:Double = delayTimeFrom(gifProperties:gifProperties)
            
        else
        {
            return nil
        }
        
        let duration:TimeInterval = TimeInterval(delayTime)
        
        return duration
    }
    
    //MARK: private
    
    private class func loadData(url:URL) -> CFData?
    {
        let data:Data
        
        do
        {
            try data = Data(
                contentsOf:url,
                options:Data.ReadingOptions.uncached)
        }
        catch
        {
            return nil
        }
        
        let cfData:CFData = data as CFData
        
        return cfData
    }
    
    private func framePropertiesAt(index:Int) -> [String:AnyObject]?
    {
        guard
            
            let properties:CFDictionary = CGImageSourceCopyPropertiesAtIndex(
                self,
                0,
                nil)
            
        else
        {
            return nil
        }
        
        let dictionary:[String:AnyObject]? = properties as? [String:AnyObject]
        
        return dictionary
    }
    
    private func delayTimeFrom(
        gifProperties:[String:AnyObject]) -> Double?
    {
        if let delayTime:Double = gifProperties[
            kCGImagePropertyGIFUnclampedDelayTime as String] as? Double
        {
            if delayTime > 0
            {
                return delayTime
            }
        }
        
        if let delayTime:Double = gifProperties[
            kCGImagePropertyGIFDelayTime as String] as? Double
        {
            return delayTime
        }
        
        return nil
    }
}
