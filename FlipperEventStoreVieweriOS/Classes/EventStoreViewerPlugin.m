/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "EventStoreViewerPlugin.h"
#import <FlipperKit/FlipperConnection.h>
#import <FlipperKit/FlipperResponder.h>

@interface EventStoreViewerPlugin ()
@property(nonatomic, strong) id<FlipperConnection> flipperConnection;
@property(nonatomic, strong) NSMutableDictionary<NSString*, NSMutableDictionary<NSString*, NSMutableArray<id>*>*>* dataCache;
@end

@implementation EventStoreViewerPlugin

- (instancetype)init {
  if (self = [super init]) {
    _dataCache = [[NSMutableDictionary alloc] init];
  }
  return self;
}

- (void)didConnect:(id<FlipperConnection>)connection {
  self.flipperConnection = connection;
  __weak typeof(self) weakSelf = self;
  [connection receive:@"getAllSharedPreferences"
            withBlock:^(NSDictionary* params, id<FlipperResponder> responder) {
                if (weakSelf != NULL) {
                  [responder success:weakSelf.dataCache];
                }
            }];
}

- (void)didDisconnect {
  self.flipperConnection = nil;
}

- (NSString*)identifier {
  return @"EventStoreViewer";
}

/// append a new value
/// @param channelName each channel is a different event store
/// @param value the value to append
/// @param key the key in the event store
- (void)channel:(NSString*)channelName
         value: (id)value
           key: (NSString*)key {

    if (self.dataCache[channelName] == NULL) {
        self.dataCache[channelName] = [[NSMutableDictionary alloc] init];
    }
    if (self.dataCache[channelName][key] == NULL) {
        self.dataCache[channelName][key] = [[NSMutableArray alloc] init];
    }

    // need cache the value in case the connection is not ready
    [self.dataCache[channelName][key] addObject:value];

    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970] * 1000;
    NSString* intervalStr = [NSString stringWithFormat:@"%f", interval];
    NSMutableDictionary* params =
            [@{@"name" : key, @"time" : intervalStr} mutableCopy];
    params[@"value"] = value;
    params[@"preferences"] = channelName;
    [self.flipperConnection send:@"sharedPreferencesChange"
                      withParams:[params copy]];
}

@end
