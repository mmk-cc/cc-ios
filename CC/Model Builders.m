//
//  PlaceBuilder.m
//  SwiftPlaces
//
//  Created by Joshua Smith on 7/26/14.
//  Copyright (c) 2014 iJoshSmith. All rights reserved.
//

#import "Model Builders.h"
#import "SwiftPlaces-Swift.h"


NSArray *BuildConcertsFromJSON(id json)
{
    NSMutableArray *concerts = [NSMutableArray array];
    for (NSDictionary *dict in [json valueForKey:@"concerts"])
        [concerts addObject:
         [[Concert alloc] initWithConcertInfoURI:dict[@"ConcertInfoURI"]
                                      mainArtist:dict[@"mainArtist"]
                                           Genre:dict[@"Genre"]
                             accompanyingArtists:dict[@"accompanyingArtists"]
                                      auditorium:dict[@"auditorium"]
                                      address:dict[@"address"]
                                            city:dict[@"city"]
                                           state:dict[@"state"]
                                         country:dict[@"country"]
                                    contactEmail:dict[@"contactEmail"]
                                      contacturl:dict[@"contacturl"]
                                        festival:dict[@"festival"]
                                      instrument:dict[@"instrument"]
                                       timestamp:dict[@"timestamp"]]];
    return concerts;
}
