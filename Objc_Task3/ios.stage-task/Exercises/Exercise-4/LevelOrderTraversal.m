#import "LevelOrderTraversal.h"

int posIndex = 0;

@interface Node : NSObject

@property NSNumber *root;
@property Node *left;
@property Node *right;

- (Node *)initWithValue:(NSNumber *)value;
- (Node *)getTree:(NSArray *) preorderTree;
- (NSMutableArray *)getLevelTraversal;

@end

@implementation Node

- (Node *)initWithValue:(NSNumber *)value {

    self = [super init];
    if (self) {
        self.root = value;
        self.left = NULL;
        self.right = NULL;
    }
    return self;
}

- (Node *)getTree:(NSArray *)preorderTree {

    if ([preorderTree count] <= posIndex || preorderTree[posIndex] == [NSNull null]) {
        return nil;
    }
    Node *node = [[Node alloc] initWithValue: preorderTree[posIndex]];

    posIndex++;
    node.left = [[Node alloc] getTree: preorderTree];

    posIndex++;
    node.right = [[Node alloc] getTree: preorderTree];

    return node;
}

- (NSMutableArray *)getLevelTraversal {

    NSMutableArray *traversalArray = [[NSMutableArray alloc] initWithObjects:[[NSMutableArray alloc] initWithObjects: self.root, nil], nil];

    if (self.left != nil) {

        NSArray *left = self.left.getLevelTraversal;
        for (int i = 0; i < left.count; ++i) {
            if (i < traversalArray.count - 1) {
                [traversalArray[i + 1] addObjectsFromArray:left[i]];
            } else {
                [traversalArray addObject: left[i]];
            }
        }
    }

    if (self.right != nil) {

        NSArray *right = self.right.getLevelTraversal;
        for (int i = 0; i < right.count; ++i) {
            if (i < traversalArray.count - 1) {
                [traversalArray[i + 1] addObjectsFromArray:right[i]];
            } else {
                [traversalArray addObject: right[i]];
            }
        }
    }

    return traversalArray;
}

@end

NSArray *LevelOrderTraversalForTree(NSArray *tree) {

    posIndex = 0;
    Node *binaryTree = [[Node alloc] getTree:tree];

    if (binaryTree != nil) {
        return [binaryTree getLevelTraversal];
    } else {
        return @[];
    }
}
