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

    NSString *address = @"Mount Rushmore";
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:address completionHandler:^(NSArray *placemarks, NSError *error) {
        for (CLPlacemark *place in placemarks) {
            MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
            annotation.coordinate = place.location.coordinate;
            annotation.title = place.subLocality;
            [self.myMapView addAnnotation:annotation];
        }
    }];
}

//This delegate method should be implemented if you want to have a custom image instead of classic pin
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    MKPinAnnotationView *pin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:nil];
    pin.canShowCallout = YES;
    pin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    pin.image = [UIImage imageNamed:@"mobilemakers"];
    return pin;
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    CLLocationCoordinate2D centerCoordinate = view.annotation.coordinate;
    MKCoordinateSpan coordinateSpan;
    coordinateSpan.latitudeDelta = 0.01;
    coordinateSpan.longitudeDelta = 0.01;
    MKCoordinateRegion region;
    region.center = centerCoordinate;
    region.span = coordinateSpan;

    [self.myMapView setRegion:region animated:YES];
}

@end
