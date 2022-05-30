//
//  PageViewController.swift
//  ui-program
//
//  Created by Soultan Muhammad Albar on 29/05/22.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var pages = [UIViewController]()
    let initialPage = 0
    lazy var pageControl: UIPageControl = {
        let pageControlView = UIPageControl()
        pageControlView.translatesAutoresizingMaskIntoConstraints = false
        pageControlView.frame = CGRect(x: 0, y: 0, width: 0, height: 80)
        pageControlView.currentPageIndicatorTintColor = UIColor.orange
        pageControlView.pageIndicatorTintColor = UIColor.lightGray
        pageControlView.numberOfPages = self.pages.count
        pageControlView.currentPage = initialPage
        return pageControlView
    }()
    
    lazy var btnNext: UIButton = {
        var btnConfiguration = UIButton.Configuration.filled()
      
        btnConfiguration.title = "BERIKUTNYA"
        btnConfiguration.attributedTitle?.font = UIFont(name: "CircularStd-Bold", size: 12)
        btnConfiguration.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 32, bottom: 12, trailing: 32)
        btnConfiguration.baseForegroundColor = .white
        btnConfiguration.baseBackgroundColor = .orange
        btnConfiguration.cornerStyle = .capsule
        
        let btn = UIButton(configuration: btnConfiguration, primaryAction: nil)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        btn.addTarget(self, action: #selector(handleNextButton), for: .touchUpInside)

        return btn
    }()
    
    lazy var bottomStack: UIStackView = {
        let bottomStackView = UIStackView(arrangedSubviews: [pageControl, btnNext])
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.axis = .horizontal
        bottomStackView.distribution = .equalCentering
        bottomStackView.sizeToFit()
        bottomStackView.layoutIfNeeded()
        
        return bottomStackView
    }()
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleNextButton() {
        if pageControl.currentPage < pages.count-1 {
            pageControl.currentPage += 1
        } else {
            pageControl.currentPage = 0
        }
        setViewControllers([pages[pageControl.currentPage]], direction: .forward, animated: true)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let viewControllerIndex = self.pages.firstIndex(of: viewController) {
            if viewControllerIndex == 0 {
                // wrap to last page in array
                return self.pages.last
            } else {
                // go to previous page in array
                return self.pages[viewControllerIndex - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = self.pages.firstIndex(of: viewController) {
            if viewControllerIndex < self.pages.count - 1 {
                // go to next page in array
                return self.pages[viewControllerIndex + 1]
            } else {
                // wrap to first page in array
                return self.pages.first
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        // set the pageControl.currentPage to the index of the current viewController in pages
        if let viewControllers = pageViewController.viewControllers {
            if let viewControllerIndex = self.pages.firstIndex(of: viewControllers[0]) {
                self.pageControl.currentPage = viewControllerIndex
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.dataSource = self
        self.delegate = self
        
        let page1 = ViewController(imageBoardName: "on_boarding1", titleBoard: "Belanja Murah", subtitleBoard: "Belanja sepuasnya gak perlu khawatir dompet ketar-ketir")
        let page2 = ViewController(imageBoardName: "on_boarding2", titleBoard: "Belanja Mudah", subtitleBoard: "Belanja semua kebutuhan harian dalam satu aplikasi")
        let page3 = ViewController(imageBoardName: "on_boarding3", titleBoard: "Belanja dari Rumah", subtitleBoard: "Belanja sambil santai, pesanan langsung diantar ke tempatmu. Bebas Ongkir!")
        
        // add the individual viewControllers to the pageViewController
        self.pages.append(page1)
        self.pages.append(page2)
        self.pages.append(page3)
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
        
        view.addSubview(bottomStack)
        
        bottomStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        bottomStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        bottomStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        
    }
    
    
    
}
