//
//  ViewController.swift
//  CollectionviewTaskAddAdditionalCell
//
//  Created by Esraa Khaled   on 29/08/2022.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    enum Section: Hashable {
        case main
        case second
    }
    var model = [ColorModel(name: "Play music", image: UIImage(named: "play music"),color: UIColor.random()),ColorModel(name: "Pause Music", image: UIImage(named:"pause music"),color: UIColor.random()),ColorModel(name: "skip back", image: UIImage(named:"skip back"),color: UIColor.random()),ColorModel(name: "skip forward", image: UIImage(named: "skip forward"),color: UIColor.random()),ColorModel(name: "clear all clipboards", image:  UIImage(named: "clear"),color: UIColor.random()),ColorModel(name: "Get clipboard", image: UIImage(named: "get"),color: UIColor.random()),ColorModel(name: "Translate Clipboard", image: UIImage(named: "translate"),color: UIColor.random()),ColorModel(name: "change clipboard", image: UIImage(named: "cut"),color: UIColor.random()),ColorModel(name: "iphone battery level", image: UIImage(named: "battery"),color: UIColor.random()),ColorModel(name: "play playlist 1", image: UIImage(named: "music"),color: UIColor.random())
]
    var model2 = [Model(name: "Create WorkSpace")]
    // MARK: - Properties

    // MARK: - Value Types
    private var dataSource: UICollectionViewDiffableDataSource<Section, AnyHashable>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = configureLayout()
        collectionView.delegate = self
        ConfigureDataSource()
        configureSnapshot()
    }
    func configureLayout() -> UICollectionViewCompositionalLayout{
           let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
          let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading:5, bottom:5, trailing: 5)
         let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension:.fractionalWidth(0.25))
           let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
          let section = NSCollectionLayoutSection(group: group)
           //section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10)
          //section.interGroupSpacing = 10
         return UICollectionViewCompositionalLayout(section: section)
     }
    func ConfigureDataSource () {
        dataSource = UICollectionViewDiffableDataSource<Section, AnyHashable>(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, item: AnyHashable) -> UICollectionViewCell? in
            if let myCell = item as? ColorModel{
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorCell.reuseIdentifier, for: indexPath) as? ColorCell else {
                    return nil
                }
                cell.musicTxt.text = myCell.name
                cell.musicImg.image = myCell.image
                cell.view.backgroundColor = myCell.color
                
                return cell
            }
            if let addCell = item as? Model{
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddCell.reuseIdentifier, for: indexPath) as? AddCell else {
                    return nil
                }
                cell.musicTxt.text = addCell.name
                return cell
            }
            
            return UICollectionViewCell()
        }
    }
    
    // 1
    func configureSnapshot() {
      var currentSnapshot = NSDiffableDataSourceSnapshot<Section, AnyHashable>()
      
      // 3
        currentSnapshot.appendSections([Section.main ,Section.second])
      // 4
     
        currentSnapshot.appendItems(model, toSection: Section.main)
        currentSnapshot.appendItems(model2, toSection: Section.second)
     
      // 5
        dataSource.apply(currentSnapshot, animatingDifferences: true)
    }
  }
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section{
        case 1:
            let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! PopupViewController
            vc.delegate = self
            self.present(vc, animated: true)
            
        default:
            break
        }
    }
}
extension ViewController: AddMusic{
    func addMusic(music: ColorModel) {
        self.dismiss(animated: true) { [self] in
            model.append(music)
            
            configureSnapshot()
        }
    }
}


