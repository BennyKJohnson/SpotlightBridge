//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Jun  9 2015 22:53:21).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2014 by Steve Nygard.
//

#import "PRSResult.h"
@class NSString;

@interface PRSCalculatorResult: PRSResult
{
    NSString *_inputString;
}

@property(readonly) NSString *inputString; // @synthesize inputString=_inputString;
- (id)type;
- (BOOL)isCalculation;
- (unsigned long long)rank;
- (unsigned long long)score;
- (id)groupName;
- (id)category;
- (BOOL)isEqual:(id)arg1;
- (BOOL)isCurrency;
- (BOOL)isConversion;
- (id)initWithDisplayName:(id)arg1 inputString:(id)arg2;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end

