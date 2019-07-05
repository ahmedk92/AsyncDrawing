//
//  ViewController.swift
//  AsyncDrawing
//
//  Created by Arabia -IT on 7/2/19.
//  Copyright © 2019 Arabia-IT. All rights reserved.
//

import UIKit

class PagerHostVC: UIViewController, UIPageViewControllerDataSource {
    private weak var pageVC: UIPageViewController!
    var vcId = ""
    
    private func makeVC() -> UIViewController {
        return storyboard!.instantiateViewController(withIdentifier: vcId)
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: nil, message: "Swipe right/left fast to compare scroll performance", preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            alert.dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = vcId
        pageVC.dataSource = self
        pageVC.setViewControllers([makeVC()], direction: .forward, animated: false, completion: nil)
        
        showAlert()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.destination is UIPageViewController {
            pageVC = segue.destination as? UIPageViewController
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return makeVC()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return makeVC()
    }
}

