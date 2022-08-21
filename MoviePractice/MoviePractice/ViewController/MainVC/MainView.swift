//
//  MainView.swift
//  MoviePractice
//
//  Created by useok on 2022/08/20.
//

import Foundation
import UIKit
import SnapKit
@available(iOS 15.0, *)
class MainView: UIView {
    //MARK: 연결
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstants()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: 크기
    let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "movie8")
        return image
    }()
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.4
        return view
    }()
    
    //미리보기 중앙
    lazy var previewImageCenter: UIImageView = {
        setImage(name: "movie6")
    }()
    //미리보기 왼쪽
    lazy var previewImageLeft: UIImageView = {
        setImage(name: "movie2")
    }()
    //미리보기 오른쪽
    lazy var previewImageRight: UIImageView = {
        setImage(name: "movie5")
    }()
    //스택뷰 미리보기
//    lazy var previewImageStackView: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [previewImageLeft,previewImageCenter,previewImageRight])
//        stackView.axis = .horizontal
//        stackView.distribution = .fillEqually
//        stackView.spacing = 30
//        stackView.backgroundColor = .red
//        return stackView
//    }()
    
    // 미리보기 라벨
    lazy var previewLabel: UILabel = {
        setLabel(title: "미리보기")
    }()
    
    // 재생버튼
    lazy var playButton: UIButton = {
        setButton(title: "", name: "play_normal")
    }()
    // 도움버튼
    lazy var infoButton: UIButton = {
        setButton(title: "정보", name: "info")
    }()
    // 내가 찜한 버튼
    lazy var myfavoriteButton: UIButton = {
        setButton(title: "내가찜한컨텐츠", name: "check")
    }()
    
    // 넷플릭스 로고
    lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "netflix_logo")
        image.contentMode = .scaleToFill
//        image.backgroundColor = .orange
        return image
    }()
    //영화버튼
    lazy var moviewButton: UIButton = {
        topButton(title: "영화")
    }()
    //tv프로그램 버튼
    lazy var tvProgramButton: UIButton = {
        topButton(title: "TV프로그램")
    }()
    //내가찜한 컨텐츠 버튼
    lazy var topMyfavoriteButton: UIButton = {
        topButton(title: "내가찜한컨텐츠")
    }()
    
    //MARK: 등록
    func configure() {
        [backgroundImage,backgroundView,previewImageLeft,previewImageCenter,previewImageRight,previewLabel,playButton,infoButton,myfavoriteButton,logoImage,moviewButton,tvProgramButton,topMyfavoriteButton].forEach {
            self.addSubview($0)
        }
    }
    
    
    //MARK: 위치
    func setConstants() {
        //백그라운드 이미지
        backgroundImage.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaInsets)
            $0.bottom.equalTo(self.safeAreaInsets)
            $0.leading.equalTo(self.safeAreaInsets)
            $0.trailing.equalTo(self.safeAreaInsets)
        }
        //백그라운드 뷰
        backgroundView.snp.makeConstraints {
            $0.top.equalTo(backgroundImage.snp.top)
            $0.bottom.equalTo(backgroundImage.snp.bottom)
            $0.leading.equalTo(backgroundImage.snp.leading)
            $0.trailing.equalTo(backgroundImage.snp.trailing)
        }
        //미리보기 중앙 이미지
        previewImageCenter.snp.makeConstraints {
            $0.center.equalTo(self)
            $0.bottom.equalTo(-100)
            $0.leading.equalTo(150)
            $0.trailing.equalTo(-150)
            $0.top.equalTo(700)
        }
        //미리보기 왼쪽 이미지
        previewImageLeft.snp.makeConstraints {
            $0.trailing.equalTo(previewImageCenter.snp.leading).offset(-30)
            $0.bottom.equalTo(previewImageCenter.snp.bottom)
            $0.height.equalTo(previewImageCenter.snp.height)
            $0.width.equalTo(previewImageCenter.snp.width)
            
        }
        //미리보기 오른쪽 이미지
        previewImageRight.snp.makeConstraints {
            $0.leading.equalTo(previewImageCenter.snp.trailing).offset(30)
            $0.bottom.equalTo(previewImageCenter.snp.bottom)
            $0.height.equalTo(previewImageCenter.snp.height)
            $0.width.equalTo(previewImageCenter.snp.width)
            
        }
        
        //스택뷰 미리보기 이미지
//        previewImageStackView.snp.makeConstraints {
//            $0.bottom.equalTo(-100)
//            $0.height.equalTo(50)
//        }
//        
        
        //미리보기 라벨
        
        previewLabel.snp.makeConstraints {
            $0.bottom.equalTo(previewImageLeft.snp.top).offset(-30)
            $0.width.equalTo(100)
            $0.height.equalTo(40)
            $0.leading.equalTo(self.safeAreaInsets).offset(30)
        }
        //재생하기 버튼    다시한번해보기
        playButton.snp.makeConstraints {
            $0.center.equalTo(self)
            $0.bottom.equalTo(previewImageCenter.snp.top).offset(-90)
            $0.trailing.equalTo(-150)
            $0.leading.equalTo(150)
            $0.top.equalTo(520)
        }
        
        // 도움버튼
        infoButton.snp.makeConstraints {
            $0.leading.equalTo(playButton.snp.trailing).offset(30)
            $0.top.equalTo(playButton.snp.top)
            $0.height.equalTo(100)
            $0.width.equalTo(120)
        }
        // 내가찜한버튼
        myfavoriteButton.snp.makeConstraints {
            $0.top.equalTo(playButton.snp.top)
            $0.trailing.equalTo(playButton.snp.leading).offset(-30)
            $0.height.equalTo(infoButton.snp.height)
            $0.width.equalTo(infoButton.snp.width)
        }
        // 로고
        logoImage.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaInsets).offset(50)
            $0.leading.equalTo(self.safeAreaInsets).offset(30)
            $0.height.width.equalTo(40)
        }
        //영화
        moviewButton.snp.makeConstraints {
            $0.leading.equalTo(logoImage.snp.trailing).offset(5)
            $0.width.equalTo(100)
            $0.height.equalTo(40)
            $0.top.equalTo(logoImage.snp.top)
        }
        //티비 프로그램
        tvProgramButton.snp.makeConstraints {
            $0.leading.equalTo(moviewButton.snp.trailing).offset(5)
            $0.width.equalTo(moviewButton.snp.width)
            $0.height.equalTo(moviewButton.snp.height)
            $0.top.equalTo(logoImage.snp.top)
        }
        // 상단 내가찜한
        topMyfavoriteButton.snp.makeConstraints {
            $0.leading.equalTo(tvProgramButton.snp.trailing).offset(5)
            
            $0.height.equalTo(tvProgramButton.snp.height)
            $0.top.equalTo(logoImage.snp.top)
            $0.trailing.equalTo(self.safeAreaInsets).offset(-10)
        }
        
    }
    
    //MARK: 함수구현
    //이미지 디자인
    func setImage(name: String) -> UIImageView  {
        let image = UIImageView()
        image.image = UIImage(named: name)
        image.layer.cornerRadius = 50
        image.layer.borderColor = UIColor.blue.cgColor
        image.layer.borderWidth = 2
        image.clipsToBounds = true
        
        return image
    }
    //라벨 디자인
    func setLabel(title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }
    // 버튼디자인
    @available(iOS 15.0, *)
    func setButton(title: String, name: String) -> UIButton {
        let buttonView = UIButton()
        var configuration = UIButton.Configuration.borderless()
        configuration.subtitle = title
        configuration.imagePlacement = .top
        configuration.imagePadding = 5
        configuration.titleAlignment = .center
        buttonView.tintColor = .black
        let config = UIImage.SymbolConfiguration(pointSize: 35, weight: .thin, scale: .default)
        buttonView.setImage(UIImage(named: name, in: nil, with: config), for: .normal)
        buttonView.configuration = configuration
        buttonView.tintColor = .white
//        buttonView.backgroundColor = .orange
        buttonView.titleLabel?.numberOfLines = 0
        return buttonView
    }
    
    // 버튼
    func topButton(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }
}
