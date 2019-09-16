import UIKit

class ImageCell: UICollectionViewCell {
    let urlImageView: URLImageView
    
    override init(frame: CGRect) {
        urlImageView = URLImageView(frame: frame)
        
        super.init(frame: frame)
        
        addSubview(urlImageView)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError() }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        urlImageView.frame = bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        urlImageView.prepareForReuse()
    }
    
    func render(url: String) {
        urlImageView.render(url: url)
    }
}
