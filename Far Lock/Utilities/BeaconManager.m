//
//  BeaconManager.m
//  Far Lock
//
//  Created by Karthik M S on 30/01/17.
//  Copyright © 2017 Karthik M S. All rights reserved.
//

#import "BeaconManager.h"

@interface BeaconManager() <CBPeripheralManagerDelegate>

@property CBPeripheralManager *peripheralManager;
@property BOOL shouldAdvertise;

@end

@implementation BeaconManager

static BeaconManager *beaconManager;

#pragma mark - Public Methods

- (instancetype)init {
    self = [super init];
    if (self) {
        self.peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:(id<CBPeripheralManagerDelegate>)self queue:nil];
    }
    return self;
}

+ (void)initBeaconManagerWithUUID:(NSUUID *)uuid major:(CLBeaconMajorValue)major minor:(CLBeaconMinorValue)minor {
    beaconManager = [[BeaconManager alloc] init];
    beaconManager.uuid = uuid;
    beaconManager.major = major;
    beaconManager.minor = minor;
}

+ (void)startAdvertisingBeacon {
    if (beaconManager.uuid) {
        beaconManager.shouldAdvertise = YES;
        NSDictionary *advertismentInfo = [self getBeaconAdvertisementInfoForUuid:beaconManager.uuid major:beaconManager.major minor:beaconManager.minor measuredPower:-59];
        [beaconManager.peripheralManager startAdvertising:advertismentInfo];
    }
    else {
        NSLog(@"BeaconManager :: uuid is nil");
    }
}

+ (void)stopAdvertisingBeacon {
    beaconManager.shouldAdvertise = NO;
}


#pragma mark - CBPeripheralManagerDelegate Methods

- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral {
    switch (peripheral.state) {
        case CBPeripheralManagerStatePoweredOn: {
            if (beaconManager.shouldAdvertise) {
                [BeaconManager startAdvertisingBeacon];
            }
            break;
        }
        case CBPeripheralManagerStatePoweredOff: {
            [BeaconManager stopAdvertisingBeacon];
            break;
        }
        default:
            break;
    }
}


#pragma mark - Misc. Methods

+ (NSDictionary *)getBeaconAdvertisementInfoForUuid:(NSUUID *)uuid major:(CLBeaconMajorValue)major minor:(CLBeaconMinorValue)minor measuredPower:(int)measuredPower {
    NSString *beaconKey = @"kCBAdvDataAppleBeaconKey";
    
    unsigned char advertisementBytes[21] = {0};
    
    [uuid getUUIDBytes:(unsigned char *)&advertisementBytes];
    
    advertisementBytes[16] = (unsigned char)(major >> 8);
    advertisementBytes[17] = (unsigned char)(major & 255);
    
    advertisementBytes[18] = (unsigned char)(minor >> 8);
    advertisementBytes[19] = (unsigned char)(minor & 255);
    
    advertisementBytes[20] = (int8_t)measuredPower;
    
    NSMutableData *advertisement = [NSMutableData dataWithBytes:advertisementBytes length:21];
    
    return [NSDictionary dictionaryWithObject:advertisement forKey:beaconKey];
}

@end
