/*
 * Copyright 2012-2013 StackMob
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "SMJSONRequestOperation.h"
#import "SMClient.h"

@implementation SMJSONRequestOperation

+ (NSSet *)acceptableContentTypes {
    NSSet *defaultAcceptableContentTypes = [super acceptableContentTypes];
    return [defaultAcceptableContentTypes setByAddingObject:@"application/vnd.stackmob+json"];
}

- (NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)response
{
    if (response) {
        NSString *host = [[request URL] host];
        if (![[[SMClient defaultClient] apiHost] isEqualToString:host]) {
            [[SMClient defaultClient] setApiHost:host];
        }
    }
    return [super connection:connection willSendRequest:request redirectResponse:response];
}

@end
