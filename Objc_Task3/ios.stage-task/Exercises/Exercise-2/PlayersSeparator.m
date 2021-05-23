#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    if(!ratingArray || ratingArray.count < 3){
        return 0;
    }
    NSInteger result=0;
    
    for (int i=0; i<ratingArray.count-2; i++) {
        int iPlayer = [ratingArray[i] intValue];
        
        for(int j=i+1; j<ratingArray.count-1; j++){
            int jPlayer = [ratingArray[j] intValue];
            
            for( int k=j+1; k<ratingArray.count; k++){
                int kPlayer = [ratingArray[k] intValue];
                
                if((iPlayer > jPlayer && jPlayer > kPlayer) || (iPlayer < jPlayer && jPlayer < kPlayer)){
                    result++;
                }
            }
        }
    }
    
    return result;
}

@end
