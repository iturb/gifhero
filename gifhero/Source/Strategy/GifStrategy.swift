import Foundation

class GifStrategy
{
    private(set) weak var view:GifView?
    
    init(view:GifView)
    {
        self.view = view
    }
    
    //MARK: public
    
    func render()
    {
    }
    
    func changeSource()
    {
        clearModel()
    }
    
    func changeSize()
    {
        clearModel()
    }
    
    func animationChange()
    {
    }
    
    //MARK: final
    
    final func clearModel()
    {
        view?.model = nil
    }
}
