//
//  InputBirthVC.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/03.
//

import Foundation
import UIKit
//생일 입력 화면
class InputBirthVC : UIViewController {
    
    
    @IBOutlet weak var labelContainer: UIView!
    
   
    @IBOutlet weak var dateBtn: UIButton!
    
    @IBOutlet weak var oldLabel: UILabel!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var signupRequest : SignupRequest? = nil

    var year = 0
    var month = 0
    var day = 0
    
    
    // 피커 뷰에 들어갈 내용 리스트
    var yearList = Array<String>()
    var monthList = Array<String>()
    var dayList = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setList()
        pickerView.dataSource = self
        pickerView.delegate = self
        attribute()
        
        
        
    }
    func setList(){
        let nowDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy" // 2020-08-13 16:30
        let str = dateFormatter.string(from: nowDate)
        var nowYear = Int(str) ?? 0
        
        for i in 1...150{
            self.yearList.append((nowYear - 100 + i).description)
        }
        
        for i in 1...12{
            self.monthList.append(i.description)
        }
        for i in 1...30{
            self.dayList.append(i.description)
        }
                
                
    }
    
    func attribute(){
        self.labelContainer.layer.cornerRadius = 10
        self.labelContainer.layer.borderWidth = 1
        self.labelContainer.layer.borderColor = UIColor(red: 0.165, green: 0.227, blue: 0.6, alpha: 1).cgColor
        
        
        nextBtn.isEnabled = false
        pickerView.isHidden = true
        
        
        dateBtn.setTitle(getTodayDate(), for: .normal)
        dateBtn.alignTextLeft(spacing: 8)
        oldLabel.isHidden = true
        
    }
    //다음 버튼 클릭 이벤트
    @IBAction func tapNextBtn(_ sender: UIButton) {
        guard var agreeTermsVC = self.storyboard?.instantiateViewController(withIdentifier: "AgreeTermsVC") as? AgreeTermsVC else { return  }
        print(self.signupRequest)
        agreeTermsVC.signupRequest = self.signupRequest
        self.navigationController?.pushViewController(agreeTermsVC, animated: false)
    }
    //변환 (yyyy년 mm월 dd일)
    func getTodayDate() -> String {
       
        
       

        let nowDate = Date() // 현재의 Date (ex: 2020-08-13 09:14:48 +0000)
        print(nowDate)
        let dateFormatter = DateFormatter()
        
        pickerView.selectRow(99, inComponent: 0, animated: true)// 피커뷰 연도 초기값
        dateFormatter.dateFormat = "M"
        pickerView.selectRow(Int(dateFormatter.string(from: nowDate))! - 1, inComponent: 1, animated: true) // 피커뷰 월 초기값
        dateFormatter.dateFormat = "d"
        pickerView.selectRow(Int(dateFormatter.string(from: nowDate))! - 1 , inComponent: 2, animated: true) // 피커뷰 일 초기값
        dateFormatter.dateFormat = "yyyy.MM.dd"
        signupRequest?.birthDate = dateFormatter.string(from: nowDate)
        dateFormatter.dateFormat = "yyyy년 MM월 dd일" // 2020-08-13 16:30
        let str = dateFormatter.string(from: nowDate) // 현재 시간의 Date를 format에 맞춰 string으로 반환
        
        
        
        //print("not yet transform time is \(tempDate)")
        
        
        return str
    }
    
    @IBAction func tapDateBtn(_ sender: UIButton) {
        pickerView.isHidden = false
    }
    

    /*
     나이 계산
     */
    func calcDateGap(yyyy : Int, mm : Int, dd : Int) -> Int{
        var result = 0
        var yearGap = 0
        var monthGap = 0
        var dayGap = 0
        
        let myDateComponents = DateComponents(year: yyyy, month: mm, day: dd)
        let startDate = Calendar.current.date(from: myDateComponents)!
        
        let offsetComps = Calendar.current.dateComponents([.year,.month,.day], from: startDate, to: Date())
        
        if case let (y?, m?, d?) = (offsetComps.year, offsetComps.month, offsetComps.day) {
            print("\(y)년 \(m)월 \(d)일 만큼 차이남")
            result = y + 1 //만나이 X
            monthGap = m
            dayGap = d
        }
        if result < 1 || monthGap < 0 || dayGap < 0 {
            self.oldLabel.isHidden = true
            nextBtn.setImage(UIImage(named: "login_next_disable_btn_img"), for: .normal)
            nextBtn.isEnabled = false
        }else {
            self.oldLabel.isHidden = false
            nextBtn.setImage(UIImage(named: "login_next_enable_btn_img"), for: .normal)
            nextBtn.isEnabled = true
        }
        
        return result
    }
    
    
}
extension InputBirthVC : UIPickerViewDataSource, UIPickerViewDelegate{
    /* 필수 */
    //UIPickerViewDataSource
        // 도르륵을 몇개 넣을지
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
           
            
            return 3
        }
        
        // pickerView 안에 들어갈 항목의 개수를 반환
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            if component == 0 {
                return yearList.count
            }else if component == 1{
                return monthList.count
            }else{
                return dayList.count
            }
            
        }
//
//    //UIPickerViewDelegate
//    // 피커 뷰 행의 높이
//        func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
//            return 44
//        }
//
//        // 피커 뷰 행의 넓이
//        func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
//            return 200
//        }
//
        // 피커 뷰에서 특정 위치(row)를 가리킬 때, 그 위치에 해당하는 문자열을 반환
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            if component == 0 {
                return yearList[row]
            }else if component == 1{
                return monthList[row]
            }else{
                return dayList[row]
            }
        }
//
//        // row 타이틀(글씨)에 적용
//        func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
//            return NSAttributedString(string: pickerList[row], attributes: attributes)
//        }
//
//        // row 뷰에서 적용
//        func pickerView(UIPickerView, viewForRow: Int, forComponent: Int, reusing: UIView?) -> UIView {
//            return UIView
//        }
//
        // 피커 뷰에서 특정 위치(row)가 선택되었을 때, 할 행동을 정의
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

            
            
            
            if component == 0 {
                year =  Int(yearList[row])!
                
            }else if component == 1{
                month =  Int(monthList[row])!
            }else{
                day =  Int(dayList[row])!
            }
            
            
            
            
            var mm = month.description
            if month < 10{
                mm = "0\(month)"
            }
            var dd = day.description
            if day < 10{
                dd = "0\(day)"
            }
            
            if year == 0{
                let nowDate = Date() // 현재의 Date (ex: 2020-08-13 09:14:48 +0000)
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy"
                year = Int(dateFormatter.string(from: nowDate))!
            }
            if month == 0{
                let nowDate = Date() // 현재의 Date (ex: 2020-08-13 09:14:48 +0000)
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM"
                mm = dateFormatter.string(from: nowDate)
                dateFormatter.dateFormat = "M"
                month = Int(dateFormatter.string(from: nowDate))!
            }
            if day == 0{
                let nowDate = Date() // 현재의 Date (ex: 2020-08-13 09:14:48 +0000)
                print(nowDate)
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd"
                dd = dateFormatter.string(from: nowDate)
                dateFormatter.dateFormat = "d"
                day = Int(dateFormatter.string(from: nowDate))!
            }
            
            //나이 출력
            print("\(year)년 \(month)월 \(day)일")
            signupRequest?.birthDate = "\(year).\(mm).\(dd)"
            oldLabel.text = "\(calcDateGap(yyyy: year, mm: month, dd: day))세"
            dateBtn.setTitle("\(year)년 \(month)월 \(day)일", for: .normal)

        }
}
