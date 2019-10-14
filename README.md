# SDCenteredScrollView

[![Version](https://img.shields.io/cocoapods/v/SDCenteredScrollView.svg?style=flat)](https://cocoapods.org/pods/SDCenteredScrollView)
[![License](https://img.shields.io/cocoapods/l/SDCenteredScrollView.svg?style=flat)](https://cocoapods.org/pods/SDCenteredScrollView)
[![Platform](https://img.shields.io/cocoapods/p/SDCenteredScrollView.svg?style=flat)](https://cocoapods.org/pods/SDCenteredScrollView)


## Example 例範

![Example 例範](Docs/demo.gif)

## Requirements 要求
This pod requires a deployment target of iOS 9.0 or greater

## Installation 安裝

SDCenteredScrollView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SDCenteredScrollView'
```
## Programmatic Usage 使用
Import Library | 匯入 SDCenteredScrollView庫
```Swift
import SDCenteredScrollView
```
Create and Apply SDCenteredCollectionViewLayout | 建立SDCenteredCollectionViewLayout
```Swift
    private var collectionView: UICollectionView = {
        
        let flowLayout = SDCenteredCollectionViewLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 100, height: 100)
        
        flowLayout.minimumLineSpacing = 10//default = 10
        flowLayout.standardItemAlpha = 0.5//default = 1
        flowLayout.standardItemScale = 0.8//defaul = 1
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
```
Adjest Insets for the focused is center cell | 修改左右邊界令當首個元件(Cell)由中間開結
```Swift
    extension ViewController: UICollectionViewDelegateFlowLayout{
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
      
      let leftEdgeInsets = collectionView.frame.size.width / 2 - ((self.cardSize.width) / 2)
      let rightEdgeInsets = collectionView.frame.size.width / 2 - ((self.cardSize.width) / 2)
        
      return UIEdgeInsets(top: 0, left: leftEdgeInsets, bottom: 0, right: rightEdgeInsets);
    }
```

## Author 作者

William Yeung, william.yeung@relaxops.com

## License 許可版權

SDCenteredScrollView is available under the MIT license. See the LICENSE file for more info.
