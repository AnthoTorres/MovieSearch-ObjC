//
//  JATMovie.h
//  MovieHybrid
//
//  Created by Anthony Torres on 12/6/19.
//  Copyright © 2019 Anthony Torres. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JATMovie : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *summary;
@property (nonatomic, strong, readonly) NSNumber *rating;

- (instancetype)initWithTitle:(NSString *)title
                      summary:(NSString *)summary
                       rating:(NSNumber *)rating;

@end

@interface JATMovie (JSONConvertible)

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
