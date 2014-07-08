//
//  HPTextViewTapGestureRecognizer.h
//  HPTextViewTapGestureRecognizer
//
//  Created by Hermes Pique on 7/8/14.
//  Copyright (c) 2014 Hermes Pique. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

@import UIKit;

@protocol HPTextViewTapGestureRecognizerDelegate<UIGestureRecognizerDelegate>

@optional

-(void)gestureRecognizer:(UIGestureRecognizer*)gestureRecognizer handleTapOnURL:(NSURL*)URL inRange:(NSRange)characterRange;

-(void)gestureRecognizer:(UIGestureRecognizer*)gestureRecognizer handleTapOnTextAttachment:(NSTextAttachment*)textAttachment inRange:(NSRange)characterRange;

@end

@interface HPTextViewTapGestureRecognizer : UITapGestureRecognizer

@property (nonatomic, weak) id<UIGestureRecognizerDelegate, HPTextViewTapGestureRecognizerDelegate> delegate;

@end
