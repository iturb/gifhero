import Foundation

class Model
{
    let items:[ModelProtocol]
    
    private class func factoryItems() -> [ModelProtocol]
    {
        let itemUrl:ModelUrl = ModelUrl()
        let itemName:ModelName = ModelName()
        let itemFill:ModelFill = ModelFill()
        let itemFit:ModelFit = ModelFit()
        let itemQuality:ModelQuality = ModelQuality()
        let itemPerformance:ModelPeformance = ModelPeformance()
        let itemHalf:ModelHalf = ModelHalf()
        
        let items:[ModelProtocol] = [
            itemUrl,
            itemName,
            itemFill,
            itemFit,
            itemQuality,
            itemPerformance,
            itemHalf]
        
        return items
    }
    
    init()
    {
        items = Model.factoryItems()
    }
}
