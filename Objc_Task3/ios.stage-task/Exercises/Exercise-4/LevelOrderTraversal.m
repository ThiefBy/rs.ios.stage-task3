#import "LevelOrderTraversal.h"

@interface Node : NSObject

@property NSNumber *Value;
@property Node *Left;
@property Node *Right;

- (instancetype)initWithValue:(NSNumber *)value;

@end

@implementation Node

- (instancetype)initWithValue:(NSNumber *)value {
    
    self = [super init];
    if (self != nil) {
        self.Value = value;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Value: %@", self.Value];
}

@end

static Node* popElement(NSMutableArray *preOrder) {
    if(preOrder.count){
        Node* value = preOrder[0];
        [preOrder removeObjectAtIndex:0];
        return value;
    }
    return nil;
}

static Node* getNode(NSMutableArray *preOrder) {
    if(preOrder.count == 0){
        return nil;
    }
    
    if(preOrder[0] == [NSNull null]){
        popElement(preOrder);
        return nil;
    }
    
    Node *node = [[Node alloc] initWithValue: preOrder[0]];
    popElement(preOrder);
    
    node.Left = getNode(preOrder);
    node.Right = getNode(preOrder);
    return node;
}

static void addByLevels(Node* root,int level, NSMutableArray* result ) {
    if(result.count <= level){
        [result addObject:[NSMutableArray new]];
    }
    
    NSMutableArray* levelArray = result[level];
    
    [levelArray addObject:root.Value];
    if(root.Left != nil){
        addByLevels(root.Left, level+1, result);
    }
    
    if(root.Right != nil){
        addByLevels(root.Right, level+1, result);
    }
}

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    if(!tree || tree.count == 0 || tree[0] == [NSNull null]){
        return @[];
    }
    NSMutableArray* preOrderStack = [tree mutableCopy];
    NSMutableArray* result = [NSMutableArray new];
    Node* rootNode = getNode(preOrderStack);
    
    addByLevels(rootNode, 0, result);
    
    return result;
}
