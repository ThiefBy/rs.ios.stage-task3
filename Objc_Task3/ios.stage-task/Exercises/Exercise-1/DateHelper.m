#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if(monthNumber<1 || monthNumber>12){
        return nil;
    }
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    NSArray *monthNames = [dateFormatter standaloneMonthSymbols];
    NSString *monthName = [monthNames objectAtIndex:(monthNumber - 1)];
    
    return monthName;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSISO8601DateFormatter *formatter = [NSISO8601DateFormatter new];
    NSDate *formatedDate = [formatter dateFromString:date];
    NSCalendar* calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents *dayComponent = [calendar components:NSCalendarUnitDay fromDate:formatedDate];
    return dayComponent.day;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    if(!date){
        return nil;
    }
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    formatter.dateFormat = @"EEE";
    
    return [formatter stringFromDate:date];
    
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar* calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSInteger week = [calendar component:NSCalendarUnitWeekOfYear fromDate:date];
    NSInteger currentWeek = [calendar component:NSCalendarUnitWeekOfYear fromDate:[NSDate now]];
    
    return week == currentWeek;
}

@end
