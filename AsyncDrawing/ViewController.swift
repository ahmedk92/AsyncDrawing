//
//  ViewController.swift
//  AsyncDrawing
//
//  Created by Arabia -IT on 7/2/19.
//  Copyright © 2019 Arabia-IT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {
    private unowned var pageVC: UIPageViewController!
    
    private func makeItemVC() -> UIViewController {
        return storyboard!.instantiateViewController(withIdentifier: "ItemViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageVC.dataSource = self
        pageVC.setViewControllers([makeItemVC()], direction: .forward, animated: false, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.destination is UIPageViewController {
            pageVC = segue.destination as? UIPageViewController
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return makeItemVC()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return makeItemVC()
    }
}

