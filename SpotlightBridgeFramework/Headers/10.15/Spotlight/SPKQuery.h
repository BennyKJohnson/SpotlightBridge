//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

//#import "NSObject.h"

@class SPKQueryDelegate, NSArray, NSMutableArray, NSString, SPKResponse;

@interface SPKQuery : NSObject
{
    NSMutableArray *_childQueries;
    double _startTime;
    int _queryState;
    unsigned long long _queryOptions;
    unsigned long long _queryId;
    unsigned long long _queryGroupId;
    NSString *_userQueryString;
    NSObject *_delegate;
    SPKQuery *_parentQuery;
    double _queryStartTime;
    NSString *_keyboardLanguage;
    id _clientResponseHandler;
    NSString *_internalUnmodifiedUserQueryString;
}

+ (BOOL)isQuerySupported:(unsigned long long)arg1;
+ (void)initialize;
@property(retain) NSString *internalUnmodifiedUserQueryString; // @synthesize internalUnmodifiedUserQueryString=_internalUnmodifiedUserQueryString;
@property(copy) id clientResponseHandler; // @synthesize clientResponseHandler=_clientResponseHandler;
@property int queryState; // @synthesize queryState=_queryState;
@property(retain) NSString *keyboardLanguage; // @synthesize keyboardLanguage=_keyboardLanguage;
@property double queryStartTime; // @synthesize queryStartTime=_queryStartTime;
@property __weak SPKQuery *parentQuery; // @synthesize parentQuery=_parentQuery;
@property(nonatomic) __weak NSObject *delegate; // @synthesize delegate=_delegate;
@property(readonly) NSString *userQueryString; // @synthesize userQueryString=_userQueryString;
@property(readonly) unsigned long long queryGroupId; // @synthesize queryGroupId=_queryGroupId;
@property(readonly) unsigned long long queryId; // @synthesize queryId=_queryId;
@property unsigned long long queryOptions; // @synthesize queryOptions=_queryOptions;
@property(readonly, getter=isDictionaryQuery) BOOL dictionaryQuery;
@property(readonly) BOOL supportsRefinement;
@property(readonly, getter=isExtensionQuery) BOOL extensionQuery;
@property(readonly, getter=isCalculatorQuery) BOOL calculatorQuery;
@property(readonly, getter=isApplicationQuery) BOOL applicationQuery;
@property(readonly, getter=isDocumentQuery) BOOL documentQuery;
@property(readonly, getter=isRemoteQuery) BOOL remoteQuery;
@property(readonly, getter=isParsecQuery) BOOL parsecQuery;
- (void)_queryDidComplete;
- (void)_queryWillStart;
- (double)startTime;
- (void)cancel;
- (void)start;
- (BOOL)isFinished;
- (BOOL)isCanceled;
- (BOOL)isCompleted;
- (BOOL)isStarted;
- (void)addChildQuery:(id)arg1;
@property(readonly) NSArray *childQueries;
@property(readonly) void (^responseHandler)(SPKResponse*);
@property(retain) NSString *unmodifiedUserQueryString;
- (id)description;
- (BOOL)updateUserQueryString:(id)arg1;
- (id)initWithUserQuery:(id)arg1 queryGroupId:(unsigned long long)arg2 options:(unsigned long long)arg3 keyboardLanguage:(id)arg4;
- (id)initWithUserQuery:(id)arg1 options:(unsigned long long)arg2;
- (id)initWithUserQuery:(id)arg1;
- (id)initWithUserQuery:(id)arg1 queryGroupId:(unsigned long long)arg2;
- (BOOL)needsIO;
- (void)setRankingQueries:(id)arg1;

@end

