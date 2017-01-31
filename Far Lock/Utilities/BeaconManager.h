//
//  BeaconManager.h
//  Far Lock
//
//  Created by Karthik M S on 30/01/17.
//  Copyright © 2017 Karthik M S. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <CoreLocation/CoreLocation.h>

@interface BeaconManager : NSObject

@property CLBeaconMajorValue major;
@property CLBeaconMinorValue minor;
@property NSUUID *uuid;

+ (void)initBeaconManagerWithUUID:(NSUUID *)uuID major:(CLBeaconMajorValue)major minor:(CLBeaconMinorValue)minor;
+ (void)startAdvertisingBeacon;
+ (void)stopAdvertisingBeacon;

@end
