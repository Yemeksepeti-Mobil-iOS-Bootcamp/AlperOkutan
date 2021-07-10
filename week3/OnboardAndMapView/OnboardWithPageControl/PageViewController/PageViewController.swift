//
//  PageViewController.swift
//  OnboardWithPageControl
//
//  Created by alper okutan on 10.07.2021.
//

import UIKit

class PageViewController: UIViewController {
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var controllers = [UIViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let vc1 = UIViewController()
        vc1.view.backgroundColor = UIColor(patternImage: UIImage(named: "1.png")!)
        controllers.append(vc1)
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = UIColor(patternImage: UIImage(named: "2.png")!)
        controllers.append(vc2)
        
        let vc3 = UIViewController()
        vc3.view.backgroundColor = UIColor(patternImage: UIImage(named: "3.png")!)
        controllers.append(vc3)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.applyVC()
    }
    
    func applyVC() {
        guard let first = controllers.first else { return }
        let vc = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
        vc.delegate = self
        vc.dataSource = self
        vc.setViewControllers([first], direction: .forward, animated: true, completion: nil)
        present(vc, animated: true, completion: nil)
    }
    
}

extension PageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.firstIndex(of: viewController), index > 0 else { return nil }
        let prev = index - 1
        pageControl.currentPage = index
        return controllers[prev]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.firstIndex(of: viewController), index < (controllers.count - 1) else { return nil }
        let next = index + 1
        pageControl.currentPage = index
        return controllers[next]
    }
}
