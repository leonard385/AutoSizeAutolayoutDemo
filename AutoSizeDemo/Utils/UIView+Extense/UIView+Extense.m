//
//  UIView+Extense.m
//  stackViewDemo
//
//  Created by niwanglong on 2018/6/28.
//  Copyright © 2018年 倪望龙. All rights reserved.
//

#import "UIView+Extense.h"
#import <objc/runtime.h>
@implementation UIView (Extense)


- (void (^)(void))systemLayoutSizeFittingSizeInvoked{
  return objc_getAssociatedObject(self, _cmd);
}

- (void)setSystemLayoutSizeFittingSizeInvoked:(void (^)(void))systemLayoutSizeFittingSizeInvoked{
     objc_setAssociatedObject(self, @selector(systemLayoutSizeFittingSizeInvoked), systemLayoutSizeFittingSizeInvoked, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

+ (void)load{
    // Inject "-pushViewController:animated:"
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(systemLayoutSizeFittingSize:);
        SEL swizzledSelector = @selector(fd_systemLayoutSizeFittingSize:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)fd_systemLayoutSizeFittingSize:(CGSize)size{
    self.systemLayoutSizeFittingSizeInvoked ? self.systemLayoutSizeFittingSizeInvoked() : nil;
    [self fd_systemLayoutSizeFittingSize:size];
}
@end
