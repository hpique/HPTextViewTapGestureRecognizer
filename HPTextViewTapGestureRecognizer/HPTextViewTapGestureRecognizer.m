//
//  HPTextViewTapGestureRecognizer.m
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

#import "HPTextViewTapGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface UITextView (HPTextViewTapGestureRecognizer)

- (CGPoint)hp_pointFromTouch:(UITouch*)touch;

@end


@implementation HPTextViewTapGestureRecognizer {
    NSURL *_URL;
    NSTextAttachment *_textAttachment;
    NSRange _range;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    if (self.state == UIGestureRecognizerStateFailed) return;
    
    UITouch *touch = [touches anyObject];
    UITextView *textView = (UITextView*) self.view;
    
    NSAssert([textView isKindOfClass:UITextView.class], @"View must be UITextView");
    
    NSTextContainer *textContainer = textView.textContainer;
    NSLayoutManager *layoutManager = textView.layoutManager;
    
    const CGPoint point = [textView hp_pointFromTouch:touch];
    NSUInteger characterIndex = [layoutManager characterIndexForPoint:point inTextContainer:textContainer fractionOfDistanceBetweenInsertionPoints:nil];
    
    if (characterIndex >= textView.text.length)
    {
        self.state = UIGestureRecognizerStateFailed;
        return;
    }
    
    { // characterIndexForPoint returns the nearest character. For better accuracy, we check if the point is inside the bounding rect of the returned character index
        const NSRange glyphRange = [layoutManager glyphRangeForCharacterRange:NSMakeRange(characterIndex, 1) actualCharacterRange:nil];
        CGRect boundingRect = [layoutManager boundingRectForGlyphRange:glyphRange inTextContainer:textContainer];
        if (!CGRectContainsPoint(boundingRect, point))
        {
            self.state = UIGestureRecognizerStateFailed;
            return;
        }
    }
    
    _textAttachment = [textView.attributedText attribute:NSAttachmentAttributeName atIndex:characterIndex effectiveRange:&_range];
    if (_textAttachment)
    {
        return;
    }
    _textAttachment = nil;
    
    _URL = [textView.attributedText attribute:NSLinkAttributeName atIndex:characterIndex effectiveRange:&_range];
    if (_URL)
    {
        return;
    }
    _URL = nil;
    
    self.state = UIGestureRecognizerStateFailed;
    return;
}

- (void)setState:(UIGestureRecognizerState)state
{
    [super setState:state];
    if (state == UIGestureRecognizerStateRecognized)
    {
        if (_textAttachment)
        {
            if ([self.delegate respondsToSelector:@selector(gestureRecognizer:handleTapOnTextAttachment:inRange:)])
            {
                [self.delegate gestureRecognizer:self handleTapOnTextAttachment:_textAttachment inRange:_range];
            }
            _textAttachment = nil;
        }
        if (_URL)
        {
            if ([self.delegate respondsToSelector:@selector(gestureRecognizer:handleTapOnURL:inRange:)])
            {
                [self.delegate gestureRecognizer:self handleTapOnURL:_URL inRange:_range];
            }
            _URL = nil;
        }
    }
    else
    {
        _textAttachment = nil;
        _URL = nil;
    }
}

@end

@implementation UITextView (hp_utils)

- (CGPoint)hp_pointFromTouch:(UITouch*)touch
{
    CGPoint point = [touch locationInView:self];
    point.x -= self.textContainerInset.left;
    point.y -= self.textContainerInset.top;
    return point;
}

@end
