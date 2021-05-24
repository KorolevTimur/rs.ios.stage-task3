#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if (monthNumber > 0 && monthNumber <= 12) {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        return [[dateFormatter monthSymbols] objectAtIndex:monthNumber -1];
    } else {
        return nil;
    }
    
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    NSString *dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    dateFormatter.dateFormat = dateFormat;
    NSDate *dateFromString = [dateFormatter dateFromString:date];
    [dateFormatter setDateFormat:@"dd"];
    
    return [[dateFormatter stringFromDate:dateFromString] intValue];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    [dateFormatter setDateFormat:@"EEEEEE"];
    return [dateFormatter stringFromDate:date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSDate *currentDate = [NSDate now];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"y"];
    if ([dateFormatter stringFromDate:currentDate] == [dateFormatter stringFromDate:date]) {
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSInteger currentWeek = [calendar component:NSCalendarUnitWeekOfYear fromDate:currentDate];
        NSInteger dateWeek = [calendar component:NSCalendarUnitWeekOfYear fromDate:date];
        return currentWeek == dateWeek;
    } else {
        return NO;
    }
}

@end
