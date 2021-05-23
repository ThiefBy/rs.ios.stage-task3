#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableArray *result = [NSMutableArray new];
    NSString * first = [string1 copy];
    NSString * second = [string2 copy];
    
    while(first.length && second.length){
        unichar char1 = [first characterAtIndex:0];
        unichar char2 = [second characterAtIndex:0];
        
        if(char1 <= char2){
            [result addObject:[NSString stringWithCharacters:&char1 length:1]];
            first = [first substringFromIndex:1];
        }
        else{
            [result addObject:[NSString stringWithCharacters:&char2 length:1]];
            second = [second substringFromIndex:1];
        }
    }
    
    if(first.length){
        [result addObject:first];
    }
    
    if(second.length){
        [result addObject:second];
    }
    
    return [result componentsJoinedByString:@""];
}

@end
