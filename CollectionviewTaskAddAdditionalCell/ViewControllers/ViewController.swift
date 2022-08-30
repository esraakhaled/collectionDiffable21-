//
//  ViewController.swift
//  CollectionviewTaskAddAdditionalCell
//
//  Created by Esraa Khaled   on 29/08/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    // MARK: - Properties
    private var sections = Section.allSections
    private lazy var dataSource = makeDataSource()
    // MARK: - Value Types
    typealias DataSource = UICollectionViewDiffableDataSource<Section, ColorModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, ColorModel>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = configureLayout()
        collectionView.register(AddCell.self, forCellWithReuseIdentifier: "AddCell")
        collectionView.delegate = self
        applySnapshot(animatingDifferences: false)
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
    func makeDataSource() -> DataSource {
      // 1
      let dataSource = DataSource(
        collectionView: collectionView,
        cellProvider: {  (collectionView, indexPath, color) ->
          UICollectionViewCell? in
          // 2
            let cell = collectionView.dequeueReusableCell(
              withReuseIdentifier: "ColorCell",
              for: indexPath) as? ColorCell
        
           
                cell?.view.backgroundColor = color.color
               cell?.musicImg.image = color.image
              cell?.musicTxt.text = color.name
                cell?.layer.cornerRadius = 20.0
               cell?.layer.borderWidth = 0.5
                cell?.backgroundColor = UIColor.clear
           
      
            
          return cell
      })
        
      return dataSource
    }
    
    // 1
    func applySnapshot(animatingDifferences: Bool = true) {
      // 2
      var snapshot = Snapshot()
      // 3
      snapshot.appendSections(sections)
      // 4
      sections.forEach { section in
          snapshot.appendItems(section.colorrs, toSection: section)
      }
      // 5
      dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
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
        self.dismiss(animated: true) {
            var snapshot = self.dataSource.snapshot()
            snapshot.appendItems([music])
          //  snapshot.insertItems([music], beforeItem: ColorModel.Type))
            // no need for reloadData()
            // no need for property observers
            // apply snapshot is all we need with diffable data source
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
}

