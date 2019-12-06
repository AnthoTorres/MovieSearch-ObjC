//
//  JATMovieController.m
//  MovieHybrid
//
//  Created by Anthony Torres on 12/6/19.
//  Copyright © 2019 Anthony Torres. All rights reserved.
//

#import "JATMovieController.h"

static NSString * const baseURL = @"https://api.themoviedb.org/3/search/movie";
static NSString * const apiQueryKey = @"api_key";
static NSString * const apiValueKey = @"d5f765d3cc40d25a1ff0e9e3c1a2c1b5";
static NSString * const searchQueryKey = @"query";
static NSString * const adultQueryKey = @"include_adult";
static NSString * const adultValueKey = @"false";

@implementation JATMovieController

+ (void)fetchMovieWithSearchTerm:(NSString *)searchTerm completionHandler:(void (^)(NSArray<JATMovie *> * _Nullable))completion
{
    NSURLComponents *urlComponent = [NSURLComponents componentsWithString:baseURL];
    NSURLQueryItem *apiQueryItem = [NSURLQueryItem queryItemWithName:apiQueryKey value:apiValueKey];
    NSURLQueryItem *searchQueryItem = [NSURLQueryItem queryItemWithName:searchQueryKey value:searchTerm];
    NSURLQueryItem *adultQueryItem = [NSURLQueryItem queryItemWithName:adultQueryKey value:adultValueKey];
    
    urlComponent.queryItems = @[apiQueryItem, searchQueryItem, adultQueryItem];
    NSURL *finalURL = urlComponent.URL;
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"Error\nIn %s: %@\n---\n%@", __PRETTY_FUNCTION__, error.localizedDescription, error);
            completion(nil);
            return;
        }
        if (data == nil)
        {
            NSLog(@"No Data in Response");
            completion(nil);
            return;
        }
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (error)
        {
            NSLog(@"Error\nIn %s: %@\n---\n%@", __PRETTY_FUNCTION__, error.localizedDescription, error);
            completion(nil);
            return;
        }
        
        NSMutableArray *movies = [NSMutableArray new];
        
        for (NSDictionary *movieDict in json[@"results"]) {
            JATMovie *movie = [[JATMovie alloc] initWithDictionary:movieDict];
            [movies addObject:movie];
        }
        completion([movies copy]);
        
    }]resume];
}

@end
