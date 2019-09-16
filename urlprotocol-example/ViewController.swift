import UIKit

class ViewController: UICollectionViewController {
    let data: [String]
    let cellId = "cell"
    
    init(data: [String]) {
        let inset: CGFloat = 8
        let rowCount = 3
        let itemSize = Int((UIScreen.main.bounds.width - inset * CGFloat(rowCount + 1)) / CGFloat(rowCount))
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
        layout.minimumLineSpacing = inset
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        
        self.data = data
        
        super.init(collectionViewLayout: layout)
    }
    
    required public init?(coder aDecoder: NSCoder) { fatalError() }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override public func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        
        if let collectionView = collectionView {
            collectionView.backgroundColor = .clear
            collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            collectionView.register(ImageCell.self, forCellWithReuseIdentifier: cellId)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCell
        cell.render(url: data[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
}
