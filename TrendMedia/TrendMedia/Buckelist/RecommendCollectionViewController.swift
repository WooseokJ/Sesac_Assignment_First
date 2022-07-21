//
//  RecommendCollectionViewController.swift
//  TrendMedia
//
//  Created by useok on 2022/07/20.
//

import UIKit
import Toast //라이브러리 가져와서사용
import Kingfisher
class RecommendCollectionViewController: UICollectionViewController {

    var imageURL = "https://img.hankyung.com/photo/202205/01.29908345.1.jpg" //외부에서가져옴

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //컬렉션뷰의 셀크기,셀사이 간격등 설명
        let layout = UICollectionViewFlowLayout() // 인스턴스생성
        
        let spacing : CGFloat = 8 // 상수로 선언해서 사용하면 편함 , 그냥숫자쓰면 Int로 들어가서 다른곳에서 오류날수도있음.
        let layoutwidth = UIScreen.main.bounds.width - (spacing * 4) // spaing * 4 는 3개의 셀에서 스크린까지 간격이 4개라서
        print("recommend")
                                                                            
        
                                                                                    // 3을 나누는건 스크린에서 3개의셀로 정렬하려고
        layout.itemSize = CGSize(width: (layoutwidth / 3), height: (layoutwidth / 3) * 1.2) // CGSize는 구조체로보면됨.
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing //가로 셀사이간격
        layout.minimumInteritemSpacing = spacing //세로 셀사이간격
        collectionView.collectionViewLayout = layout
    }

    // 셀의 개수(cell개수묻는거랑비슷)
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    

    // 셀에 데이터삽입 및 디자인(cell과 비슷)
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendCollectionViewCell", for: indexPath) as! RecommendCollectionViewCell
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendCollectionViewCell", for: indexPath) as? RecommendCollectionViewCell
        else{
            return UICollectionViewCell() // 애플에서만든 인스턴스가 반환
        }
        
        
        cell.posterImageView.backgroundColor = .orange
//        cell.posterImageView?.image = UIImage(systemName: "star.fill")
        
        let url = URL(string: imageURL)
        cell.posterImageView.kf.setImage(with:url)
        
        return cell
    }
    // heightForRowAt(item(셀)의 높이)가 없는이유: 아이템의 높이가아니라 행의높이라서 -> FlowLayOut
    
    //didSelectRowAt 있음(테이블뷰는) , 컬렉션뷰는 didSelectItemAt
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        view.makeToast("\(indexPath.item)번쨰 셀을 선택")
        view.makeToast("\(indexPath.item)번쨰 셀을 선택",duration:1,position:.center) //이건 외우는거아니고 찾아보는거 (깃허브 라이브러리 리드미확인)
        self.navigationController?.popViewController(animated: true)
    }
    
}
