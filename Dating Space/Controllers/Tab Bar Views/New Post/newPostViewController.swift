//
//  newPostViewController.swift
//  Dating Space
//
//  Created by Harry Jeffs on 26/9/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import UIKit
import Pageboy
import GradientProgressBar
import Neon
import SwiftIcons
class newPostViewController: PageboyViewController {
    
    let viewControllers = [
        navControllerViewController.init(rootViewController: nameViewController()),   navControllerViewController.init(rootViewController: genderOnboardingViewController()), navControllerViewController.init(rootViewController: prosOnboardingViewController()), navControllerViewController.init(rootViewController: consOnboardingViewController()), navControllerViewController.init(rootViewController: socialOnboardingViewController()),
            navControllerViewController.init(rootViewController: imageSelectorOnboaringViewController()),
            navControllerViewController.init(rootViewController: previewOnboardingViewController())
    ]
    
    let progressView = GradientProgressBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Home Page")
        
        dataSource = self
        delegate = self
        // isScrollEnabled = false
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.topItem?.title = "New Post"

        self.navigationController?.navigationItem.hidesBackButton = false
        
        let backButton = UIBarButtonItem()
        backButton.title = "New Back Button Text"
        backButton.style = .plain   
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: .init(icon: .icofont(.arrowLeft), size: CGSize(width: 40, height: 40), textColor: .black, backgroundColor: .systemPink), style: .plain, target: nil, action: #selector(previousPage))
        
        let backLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        backLabel.text = "Back"
        backLabel.textColor = .black
        backLabel.backgroundColor = .orange
        view.addSubview(backLabel)
       // backLabel.align(.toTheRightCentered, relativeTo: backButton, padding: 0, width: 200, height: 40)
        
        self.view.backgroundColor = .white
        
        NotificationCenter.default.addObserver(self, selector: #selector(nextPage), name: Notification.Name("toNextPage"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(previousPage), name: Notification.Name("backPageOnboarding"), object: nil)
        
        setupProgressView()
    }
    
    private func setupProgressView() {
        guard let navigationBar = navigationController?.navigationBar else { return }

        progressView.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.addSubview(progressView)

        progressView.setProgress(0.1, animated: true)
        progressView.gradientColors = [
            UIColor(hexString: "#00d2ff"),
            UIColor(hexString: "#3a47d5")
        ]
        
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor),

            progressView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            progressView.heightAnchor.constraint(equalToConstant: 3.0)
        ])
    }
    
    @objc func nextPage(){
        self.scrollToPage(.next, animated: true)
    }
    @objc func previousPage(){
        self.scrollToPage(.previous, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
extension newPostViewController: PageboyViewControllerDataSource {
        func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
            return viewControllers.count
        }

        func viewController(for pageboyViewController: PageboyViewController,
                            at index: PageboyViewController.PageIndex) -> UIViewController? {
            return viewControllers[index]
        }
        
        func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
            return nil
        }
}
extension newPostViewController : PageboyViewControllerDelegate{
    func pageboyViewController(_ pageboyViewController: PageboyViewController, willScrollToPageAt index: PageboyViewController.PageIndex, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        
    }
    
    func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollTo position: CGPoint, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        
    }
    
    func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollToPageAt index: PageboyViewController.PageIndex, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        print("yeet")
        var math : Float = 0
        
        if index == viewControllers.count - 1{
            math = 1
        }else{
            math = Float(Double(index) / Double(viewControllers.count))
        }
        progressView.setProgress(math, animated: true)
    }
    
    func pageboyViewController(_ pageboyViewController: PageboyViewController, didReloadWith currentViewController: UIViewController, currentPageIndex: PageboyViewController.PageIndex) {
        
    }
    
    
}
