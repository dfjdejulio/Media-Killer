//
//  ContentBlockerRequestHandler.m
//  Media Killer Content Blocker
//
//  Created by Doug DeJulio on 2017-08-04.
//  Copyright © 2017 Doug DeJulio. All rights reserved.
//

#import "ContentBlockerRequestHandler.h"

@interface ContentBlockerRequestHandler ()

@end

@implementation ContentBlockerRequestHandler

- (void)beginRequestWithExtensionContext:(NSExtensionContext *)context {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSURL *jsonUrl;
    
    if ([defaults boolForKey:@"enabled_preference"]) {
        jsonUrl = [[NSBundle mainBundle] URLForResource:@"blockAllMedia" withExtension:@"json"];
    } else {
        jsonUrl = [[NSBundle mainBundle] URLForResource:@"doNotBlockAllMedia" withExtension:@"json"];
    }
    
    NSItemProvider *attachment = [[NSItemProvider alloc] initWithContentsOfURL: jsonUrl];
    
    NSExtensionItem *item = [[NSExtensionItem alloc] init];
    item.attachments = @[attachment];
    
    [context completeRequestReturningItems:@[item] completionHandler:nil];
}

@end
