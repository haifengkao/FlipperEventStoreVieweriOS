/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */



#ifndef FlipperEventStoreViewer_GUARD
#define FlipperEventStoreViewer_GUARD

@import Foundation;
@import FlipperKit;

NS_ASSUME_NONNULL_BEGIN


@interface EventStoreViewerPlugin : NSObject<FlipperPlugin>

- (instancetype)init;
- (void)channel:(NSString*)channelName
         values: (NSArray<id>*)values
           key: (NSString*)key;

@end

NS_ASSUME_NONNULL_END

#endif
