//
//  ViewController.m
//  MobileMapper
//
//  Created by Efrén Reyes Torres on 8/5/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController ()<MKMapViewDelegate>
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

//This delegate method should be implemented if you want to have a custom image instead of classic pin
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    MKPinAnnotationView *pin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:nil];
    pin.canShowCallout = YES;
    pin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    pin.image = [UIImage imageNamed:@"mobilemakers"];
    return pin;
}

@end
