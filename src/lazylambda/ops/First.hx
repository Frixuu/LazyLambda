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
    public static extern inline overload function first<T>(src: Iterator<T>): Option<T> {
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
    public static extern inline overload function first<T>(
        src: Iterator<T>,
        predicate: (item: T) -> Bool
    ): Option<T> {
    
        var item: Option<T> = None;
        while (src.hasNext()) {
            final candidate = src.next();
            if (predicate(candidate)) {
                item = Some(candidate);
                break;
            }
        }
        
        return item;
    }
    
    /**
        Moves the first available item out from the source iterator, if it has one.
        @param src The source iterator.
        @return The first item of source, or `null` if the source iterator was empty.
    **/
    public static extern inline overload function firstOrNull<T>(src: Iterator<T>): Null<T> {
    
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
    public static extern inline overload function firstOrNull<T>(
        src: Iterator<T>,
        predicate: (item: T) -> Bool
    ): Null<T> {
    
        var item: Null<T> = null;
        while (src.hasNext()) {
            final candidate = src.next();
            if (predicate(candidate)) {
                item = candidate;
                break;
            }
        }
        
        return item;
    }
    
    /**
        Moves the first available item out from the source iterator, if it has one.
        @param src The source iterator.
        @return The first item of source.
        @throws NoItemsException The source iterator was empty.
    **/
    public static extern inline overload function firstOrThrow<T>(src: Iterator<T>): T {
    
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
    public static extern inline overload function firstOrThrow<T>(
        src: Iterator<T>,
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
