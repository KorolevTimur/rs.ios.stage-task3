#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableString *firstString = [[NSMutableString alloc] initWithString:string1];
    NSMutableString *secondString = [[NSMutableString alloc] initWithString:string2];
    NSMutableString *result = [NSMutableString new];
    
    while (firstString.length > 0 && secondString.length > 0) {
        if ([firstString UTF8String][0] <= [secondString UTF8String][0]) {
            [result appendFormat:@"%c", [firstString characterAtIndex:0]];
            [firstString deleteCharactersInRange:NSMakeRange(0, 1)];
        } else {
            [result appendFormat:@"%c", [secondString characterAtIndex:0]];
            [secondString deleteCharactersInRange:NSMakeRange(0, 1)];
        }
    }
    
    if (firstString.length == 0) {
        [result appendString:secondString];
    } else {
        [result appendString:firstString];
    }
    
    return result;
}

@end
