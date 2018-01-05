//
//  AdGuardHook.m
//  AdGuardHook
//
//  Created by xnxin on 2018/1/5.
//  Copyright © 2018年 ShengZhen CreditHome. All rights reserved.
//

#import "substrate.h"
#import <Foundation/Foundation.h>

@class AASDLicenseInfo;

static int (*origin_AASDLicenseInfo_licenseType)(AASDLicenseInfo*,SEL);
static int new__AASDLicenseInfo_licenseType(AASDLicenseInfo* self,SEL _cmd){
    return 2;
}

static int (*origin_AASDLicenseInfo_status)(AASDLicenseInfo*,SEL);
static int new__AASDLicenseInfo_status(AASDLicenseInfo* self,SEL _cmd){
    return 1;
}

static NSDate* (*origin_AASDLicenseInfo_expirationDate)(AASDLicenseInfo*,SEL);
static NSDate* new__AASDLicenseInfo_expirationDate(AASDLicenseInfo* self,SEL _cmd){
    return [NSDate dateWithTimeIntervalSince1970:99999999999];
}

static NSString* (*origin_AASDLicenseInfo_licenseKey)(AASDLicenseInfo*,SEL);
static NSString* new__AASDLicenseInfo_licenseKey(AASDLicenseInfo* self,SEL _cmd){
    return @"T7RPS23D";
}


static void __attribute__((constructor)) initialize(void) {
    MSHookMessageEx(objc_getClass("AASDLicenseInfo"),
                    @selector(licenseType),
                    (IMP)&new__AASDLicenseInfo_licenseType,
                    (IMP*)&origin_AASDLicenseInfo_licenseType);
    
    MSHookMessageEx(objc_getClass("AASDLicenseInfo"),
                    @selector(status),
                    (IMP)&new__AASDLicenseInfo_status,
                    (IMP*)&origin_AASDLicenseInfo_status);
    
    MSHookMessageEx(objc_getClass("AASDLicenseInfo"),
                    @selector(expirationDate),
                    (IMP)&new__AASDLicenseInfo_expirationDate,
                    (IMP*)&origin_AASDLicenseInfo_expirationDate);
    
    MSHookMessageEx(objc_getClass("AASDLicenseInfo"),
                    @selector(licenseKey),
                    (IMP)&new__AASDLicenseInfo_licenseKey,
                    (IMP*)&origin_AASDLicenseInfo_licenseKey);

}
