//
//  ItemVC.swift
//  AsyncDrawing
//
//  Created by Arabia -IT on 7/2/19.
//  Copyright © 2019 Arabia-IT. All rights reserved.
//

import UIKit

class ItemVC: UIViewController {
    private static let queue = DispatchQueue(label: "AsyncRenderer")
    private let renderer = AsyncRenderer(queue: ItemVC.queue, text: NSAttributedString(string: """
دار سقطت غرّة، مع, ألمّ التحالف وقد تم. لمحاكم بمحاولة أي بال, ان انه تحرير الأرضية, للصين قائمة الثقيلة ما حين. عل كلّ مقاطعة العسكري, تم بحق ثانية بزمام وفرنسا. خلاف لكون الجنود بعض ان, أوزار الأولى للمجهود شيء بل. انه قد السيء الجنوب, شواطيء الثالث من بها.

و حدى أفاق فاتّبع. فعل أوزار نتيجة ليتسنّى ما, بين بل الصينية الجنرال. في مدن الباهضة المعاهدات, أما يتبقّ اوروبا في, بحث عرفها اتّجة البرية عن. فسقط فرنسا الأسيوي إذ بلا, جعل ومضى أملاً علاقة إذ.

مع لكل واحدة الستار, الجوي القوى بالجانب بين أم. تم والحزب سبتمبر جعل, يبق وقرى تصرّف مليون هو. المضي الصفحة المنتصر عل دول. لم خلاف يتسنّى الباهضة بلا.

جيما وحرمان أخر أي, مشروط وبالتحديد، لم هذه, أي قبل مارد الخطّة اتفاقية. بحق إذ يقوم المبرمة. بخطوط يتسنّى تم ضرب, فقد ما وجزر بقيادة. أخر مع مرمى وحتى الأوروبية.

تصفح فهرست بالسيطرة بال ما. بحق تم ويعزى وانهاء, لكل من الضروري الإقتصادي. فعل و جديدة بلاده غينيا. ان لها واُسدل المشترك الخارجية, قد فصل واستمر واشتدّت ويكيبيديا. أطراف الشمال شموليةً بـ لكل, أم مارد والفلبين غير.

""", attributes: [
    NSAttributedString.Key.foregroundColor : UIColor.black,
    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20),
    NSAttributedString.Key.paragraphStyle: { let mps = NSMutableParagraphStyle(); mps.alignment = .right; return mps }()
    ]))
    
    @IBOutlet private weak var textView: UIView!
    @IBOutlet private weak var textViewHeightConstraint: NSLayoutConstraint!
    
    private func draw() {
        self.renderer.draw(size: CGSize(width: self.textView.bounds.width, height: .infinity)) { (size, cgImage) in
            DispatchQueue.main.async {
                self.textViewHeightConstraint.constant = size.height
                
                self.textView.layer.contentsScale = UIScreen.main.scale
                self.textView.layer.contentsGravity = .right
                self.textView.layer.contents = cgImage
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        draw()
    }
}
