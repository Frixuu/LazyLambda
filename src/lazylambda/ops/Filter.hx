// SPDX-License-Identifier: MIT
package lazylambda.ops;

import haxe.ds.Option;
import haxe.extern.EitherType;
import lazylambda.iterators.IIterator;
import lazylambda.iterators.IteratorFiltering;
import lazylambda.iterators.IteratorFilteringIs;
import lazylambda.iterators.IteratorFilteringNonNull;
import lazylambda.iterators.IteratorFilteringSome;

final class Filter {

    /**
        Filters the source iterator, yielding only items that satisfy the predicate.
        @param src The source iterator.
        @param predicate The predicate to match.
        @return A new iterator.
    **/
    @:generic
    public static extern inline overload function filter<S: Iterator<T>, T>(
        src: S,
        predicate: (item: T) -> Bool
    ): IIterator<T> {
        return new IteratorFiltering(src, predicate);
    }
    
    /**
        Filters the source iterator, yielding only items that are of the specified type.
        @param src The source iterator.
        @param matcher One of:
                       - a class or an interface (generics-erased),
                       - an enum (generics-erased),
                       - a primitive type.
                       Abstracts, e.g. `haxe.Int64`, are not supported.
        @return A new iterator.
    **/
    public static extern inline overload function filterIs<S: Iterator<T>, T, R>(
        src: S,
        matcher: EitherType<Enum<R>, EitherType<Class<R>, Any>>
    ): IIterator<R> {
        return new IteratorFilteringIs(src, matcher);
    }
    
    #if (haxe < version("4.3.0"))
    /* On 4.2.5 and lower, e.g. Abstract<Int> cannot unify through EitherType */
    /**
        Filters the source iterator, yielding only items that are of the specified type.
        @param src The source iterator.
        @param matcher One of:
                       - a class or an interface (generics-erased),
                       - an enum (generics-erased),
                       - a primitive type.
                       Abstracts, e.g. `haxe.Int64`, are not supported.
        @return A new iterator.
    **/
    public static extern inline overload function filterIs<S: Iterator<T>, T, R>(
        src: S,
        matcher: Any
    ): IIterator<R> {
        return new IteratorFilteringIs(src, matcher);
    }
    #end
    
    /**
        Filters the source iterator, yielding only items that are not `null`.
        @param src The source iterator.
        @return A new iterator.
    **/
    @:generic
    public static extern inline overload function filterNonNull<S: Iterator<Null<T>>, T>(
        src: S
    ): IIterator<T> {
        return new IteratorFilteringNonNull(src);
    }
    
    /**
        Filters the source iterator, yielding only items that are not `None`.
        @param src The source iterator.
        @return A new iterator.
    **/
    @:generic
    public static extern inline overload function filterSome<S: Iterator<Option<T>>, T>(
        src: S
    ): IIterator<T> {
        return new IteratorFilteringSome(src);
    }
}
