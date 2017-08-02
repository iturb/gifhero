import Foundation

class Model
{
    let items:[ModelProtocol]
    
    private class func factoryItems() -> [ModelProtocol]
    {
        let items:[ModelProtocol] = [
        ]
        
        return items
    }
    
    init()
    {
        items = Model.factoryItems()
    }
}
