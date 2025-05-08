// SPDX-License-Identifier: MIT
package lazylambda.ops;

import haxe.ds.Option;
import lazylambda.NoItemsException;

final class First {

    /**
        Moves the first available item out from the source iterator, if it has one.
        @param src The source iterator.
        @return The first item of source, or `None` if the source iterator was empty.
    **/
    public static extern inline overload function first<S: Iterator<T>, T>(src: S): Option<T> {
        return if (!src.hasNext()) {
            None;
        } else {
            Some(src.next());
        };
    }
    
    /**
        Drains the source iterator until the first matching item, if it has one.
        @param src The source iterator.
        @param predicate The condition to match.
        @return The first matching item of source, or `None` if there was none.
    **/
    public static extern inline overload function first<S: Iterator<T>, T>(
        src: S,
        predicate: (item: T) -> Bool
    ): Option<T> {
    
        var matchingItem: Option<T> = None;
        while (src.hasNext()) {
            final item: T = src.next();
            if (predicate(item)) {
                matchingItem = Some(item);
                break;
            }
        }
        
        return matchingItem;
    }
    
    /**
        Moves the first available item out from the source iterator, if it has one.
        @param src The source iterator.
        @return The first item of source, or `null` if the source iterator was empty.
    **/
    public static extern inline overload function firstOrNull<S: Iterator<T>, T>(src: S): Null<T> {
    
        if (!src.hasNext()) {
            return null;
        }
        
        return src.next();
    }
    
    /**
        Drains the source iterator until the first matching item, if it has one.
        @param src The source iterator.
        @param predicate The condition to match.
        @return The first matching item of source, or `null` if there was none.
    **/
    public static extern inline overload function firstOrNull<S: Iterator<T>, T>(
        src: S,
        predicate: (item: T) -> Bool
    ): Null<T> {
    
        var matchingItem: Null<T> = null;
        while (src.hasNext()) {
            final item: T = src.next();
            if (predicate(item)) {
                matchingItem = item;
                break;
            }
        }
        
        return matchingItem;
    }
    
    /**
        Moves the first available item out from the source iterator, if it has one.
        @param src The source iterator.
        @return The first item of source.
        @throws NoItemsException The source iterator was empty.
    **/
    public static extern inline overload function firstOrThrow<S: Iterator<T>, T>(src: S): T {
    
        if (!src.hasNext()) {
            throw new NoItemsException();
        }
        
        return src.next();
    }
    
    /**
        Drains the source iterator until the first matching item, if it has one.
        @param src The source iterator.
        @param predicate The condition to match.
        @return The first matching item of source.
        @throws NoItemsException The source iterator had no matching items.
    **/
    public static extern inline overload function firstOrThrow<S: Iterator<T>, T>(
        src: S,
        predicate: (item: T) -> Bool
    ): T {
        return switch (first(src, predicate)) {
            case Some(item):
                item;
            case None:
                throw new NoItemsException();
        };
    }
}
