import Foundation
import ImageIO

extension CGImageSource
{
    class func factorySource(url:URL) -> CGImageSource?
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
    
    class func optionsNoCache() -> CFDictionary
    {
        let dictionary:[String:Any] = [
            kCGImageSourceShouldCache as String:kCFBooleanFalse]
        let cfDictionary:CFDictionary = dictionary as CFDictionary
        
        return cfDictionary
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
}
