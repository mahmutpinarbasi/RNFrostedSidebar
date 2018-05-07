//
//  ViewController.m
//  RNFrostedSidebar
//
//  Created by Ryan Nystrom on 8/13/13.
//  Copyright (c) 2013 Ryan Nystrom. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableIndexSet *optionIndices;
@property (nonatomic, assign) BOOL didShowCallout;
@property (nonatomic, strong) RNFrostedSidebar * callOut;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.optionIndices = [NSMutableIndexSet indexSetWithIndex:0];
    [self prepareCallOut];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (!self.didShowCallout) {
        self.didShowCallout = YES;
        [self showCallout];
    }
    
}

- (IBAction)onBurger:(id)sender{
    [self showCallout];
}

- (void)prepareCallOut{
    NSArray *images = @[
                        [UIImage imageNamed:@"side_bar_icon_around_me_unselected"],
                        [UIImage imageNamed:@"side_bar_icon_calendar_unselected"],
                        [UIImage imageNamed:@"side_bar_icon_application_unselected"],
                        [UIImage imageNamed:@"side_bar_icon_document_unselected"],
                        [UIImage imageNamed:@"side_bar_icon_procedure_unselected"],
                        [UIImage imageNamed:@"side_bar_icon_report_selected"]
                        ];
    
    NSArray *selectedImages = @[
                        [UIImage imageNamed:@"side_bar_icon_around_me_selected"],
                        [UIImage imageNamed:@"side_bar_icon_calendar_selected"],
                        [UIImage imageNamed:@"side_bar_icon_application_selected"],
                        [UIImage imageNamed:@"side_bar_icon_document_selected"],
                        [UIImage imageNamed:@"side_bar_icon_procedure_selected"],
                        [UIImage imageNamed:@"side_bar_icon_report_selected"]
                        ];
    
    NSArray *colors = @[
                        [UIColor colorWithRed:23/255.f green:146/255.f blue:212/255.f alpha:1],
                        [UIColor colorWithRed:23/255.f green:146/255.f blue:212/255.f alpha:1],
                        [UIColor colorWithRed:23/255.f green:146/255.f blue:212/255.f alpha:1],
                        [UIColor colorWithRed:23/255.f green:146/255.f blue:212/255.f alpha:1],
                        [UIColor colorWithRed:23/255.f green:146/255.f blue:212/255.f alpha:1],
                        [UIColor colorWithRed:23/255.f green:146/255.f blue:212/255.f alpha:1]
                        ];
    
    NSArray * titles = @[@"Around Me",@"Calendar",@"Application",@"Documents",@"Procedures",@"Reports"];
    self.callOut = [[RNFrostedSidebar alloc] initWithImages:images selectedImages:selectedImages selectedIndices:self.optionIndices borderColors:colors titles:titles];
    self.callOut.delegate = self;
    self.callOut.isSingleSelect = YES;
    self.callOut.dismissEnabled = NO;
    self.callOut.width = 80.0;
    self.callOut.itemSize = CGSizeMake(75.0, 106);
    
}

- (void)showCallout{
    [self.callOut showInViewController:self animated:YES];
    
    // sideBar varsayılan olarak parentView'ın frameini alıyor. biz bunu fixed `width` ile değiştiriyoruz.
    CGRect sideBarFrame = self.callOut.view.frame;
    sideBarFrame.size.width = self.callOut.width;
    self.callOut.view.frame = sideBarFrame;
    
}


#pragma mark - RNFrostedSidebarDelegate

- (void)sidebar:(RNFrostedSidebar *)sidebar didTapItemAtIndex:(NSUInteger)index {
    NSLog(@"Tapped item at index %lu",(unsigned long)index);
    if (index == 3) {
        [sidebar dismissAnimated:YES completion:nil];
    }
}

- (void)sidebar:(RNFrostedSidebar *)sidebar didEnable:(BOOL)itemEnabled itemAtIndex:(NSUInteger)index {
    if (itemEnabled) {
        [self.optionIndices addIndex:index];
    }
    else {
        [self.optionIndices removeIndex:index];
    }
}

@end
