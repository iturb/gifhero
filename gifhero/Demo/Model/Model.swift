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
        
        let items:[ModelProtocol] = [
            itemUrl,
            itemName,
            itemFill,
            itemFit]
        
        return items
    }
    
    init()
    {
        items = Model.factoryItems()
    }
}
