//
//  ViewController.m
//  MobileMapper
//
//  Created by Efrén Reyes Torres on 8/5/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController ()
@property (strong, nonatomic) IBOutlet MKMapView *myMapView;
@property MKPointAnnotation *mobileMakersAnnotation;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	CLLocationCoordinate2D coordinate;
    coordinate.latitude = 41.89373984;
    coordinate.longitude = -87.63532979;

    self.mobileMakersAnnotation = [[MKPointAnnotation alloc]init];
    self.mobileMakersAnnotation.coordinate = coordinate;
    self.mobileMakersAnnotation.title = @"MOBILE MAKERS!";
    [self.myMapView addAnnotation:self.mobileMakersAnnotation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
