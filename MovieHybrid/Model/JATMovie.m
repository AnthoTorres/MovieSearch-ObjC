//
//  JATMovie.m
//  MovieHybrid
//
//  Created by Anthony Torres on 12/6/19.
//  Copyright © 2019 Anthony Torres. All rights reserved.
//

#import "JATMovie.h"

static NSString * const titleKey = @"title";
static NSString * const summaryKey = @"overview";
static NSString * const ratingKey = @"vote_average";

@implementation JATMovie

- (instancetype)initWithTitle:(NSString *)title
                      summary:(NSString *)summary
                       rating:(NSNumber *)rating
{
    self = [super init];
    if (self)
    {
        _title = title;
        _summary = summary;
        _rating = rating;
        
    }
    return self;
}

@end

@implementation JATMovie (JSONConvertible)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[titleKey];
    NSString *summary = dictionary[summaryKey];
    NSNumber *rating = dictionary[ratingKey];
    
    return [self initWithTitle:title summary:summary rating:rating];
}

@end
