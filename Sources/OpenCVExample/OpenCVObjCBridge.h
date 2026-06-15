#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OpenCVMatSummary : NSObject

@property(nonatomic, readonly) int rows;
@property(nonatomic, readonly) int cols;
@property(nonatomic, readonly) int type;

- (instancetype)initWithRows:(int)rows cols:(int)cols type:(int)type;

@end

@interface OpenCVObjCBridge : NSObject

+ (OpenCVMatSummary *)onePixelMatSummary;

@end

NS_ASSUME_NONNULL_END
