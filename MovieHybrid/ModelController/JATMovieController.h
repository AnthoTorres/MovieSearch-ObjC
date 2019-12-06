//
//  JATMovieController.h
//  MovieHybrid
//
//  Created by Anthony Torres on 12/6/19.
//  Copyright © 2019 Anthony Torres. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JATMovie.h"


NS_ASSUME_NONNULL_BEGIN

@interface JATMovieController : NSObject

+ (void)fetchMovieWithSearchTerm:(NSString *)searchTerm
           completionHandler:(void (^) (NSArray<JATMovie *> * _Nullable))completion;

@end

NS_ASSUME_NONNULL_END
