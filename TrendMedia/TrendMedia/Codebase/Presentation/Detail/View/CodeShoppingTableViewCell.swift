import UIKit
import SnapKit

class CodeShoppingTableViewCell: BaseTableViewCell {
        
    
    //MARK: UITableViewCell 에 메서드 전달
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        setConstraints()
        self.checkButton.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
        self.checkStar.addTarget(self, action: #selector(checkStarClicked), for: .touchUpInside)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: 버튼 delegate 연결
    var checkBoxCellDelegate: ContentsMainTextDelegate?
    var checkStarCellDelegate: ContentsMainTextDelegate?
    
    // 체크버튼클릭시
     @objc func checkButtonClicked() {
         checkBoxCellDelegate?.checkButtonFunc(checkButton)
     }
    // 별버튼클릭시
    @objc func checkStarClicked() {
        checkStarCellDelegate?.checkStarFunc(checkStar)
    }
    
    override func layoutSubviews() {
        // 테이블 뷰 셀 사이의 간격
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0))
    }

    //MARK: 크기
    // 라벨
    let labelText: UILabel = {
        let label = UILabel()
        return label
    }()
    // 체크버튼
    let checkButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        return button
    }()
    //  별 버튼
    let checkStar: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        return button
    }()

    //MARK: 뷰등록
    override func configure() {
        [labelText,checkButton,checkStar].forEach {
            contentView.addSubview($0)
        }
    }
    //MARK: 위치
    override func setConstraints() {
        // 라벨
        labelText.snp.makeConstraints {
            $0.leading.equalTo(checkButton.snp.trailing)
            $0.trailing.equalTo(checkStar.snp.leading)
            $0.top.equalTo(0)
            $0.bottom.equalTo(0)

        }
        // 체크박스
        checkButton.snp.makeConstraints {
            $0.leading.equalTo(self.safeAreaLayoutGuide)
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
            $0.width.equalTo(60)
        }
        // 별 버튼
        checkStar.snp.makeConstraints {
            $0.trailing.equalTo(self.safeAreaLayoutGuide)
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
            $0.width.equalTo(60)
        }
    }
}

protocol ContentsMainTextDelegate: AnyObject {
    // 위임해줄 기능
    func checkButtonFunc(_ sender: UIButton)
    func checkStarFunc(_ sender: UIButton)
}
