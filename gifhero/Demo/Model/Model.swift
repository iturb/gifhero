import Foundation

class Model
{
    let items:[ModelProtocol]
    
    private class func factoryItems() -> [ModelProtocol]
    {
        let itemUrl:ModelUrl = ModelUrl()
        let itemName:ModelName = ModelName()
        
        let items:[ModelProtocol] = [
//            itemUrl,
            itemName]
        
        return items
    }
    
    init()
    {
        items = Model.factoryItems()
    }
}
