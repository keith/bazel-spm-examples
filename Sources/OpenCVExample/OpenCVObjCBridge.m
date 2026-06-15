#import "OpenCVObjCBridge.h"
#import "OpenCVCppBridge.h"

@implementation OpenCVMatSummary

- (instancetype)initWithRows:(int)rows cols:(int)cols type:(int)type {
    self = [super init];
    if (self) {
        _rows = rows;
        _cols = cols;
        _type = type;
    }
    return self;
}

@end

@implementation OpenCVObjCBridge

+ (OpenCVMatSummary *)onePixelMatSummary {
    return [[OpenCVMatSummary alloc] initWithRows:OpenCVCppOnePixelRows()
                                            cols:OpenCVCppOnePixelCols()
                                            type:OpenCVCppOnePixelType()];
}

@end
