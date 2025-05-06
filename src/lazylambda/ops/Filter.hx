// SPDX-License-Identifier: MIT
package lazylambda.ops;

import haxe.ds.Option;
import haxe.extern.EitherType;
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
    public static extern inline overload function filter<T>(
        src: Iterator<T>,
        predicate: (item: T) -> Bool
    ): Iterator<T> {
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
    public static extern inline overload function filterIs<T, R>(
        src: Iterator<T>,
        matcher: EitherType<Enum<R>, EitherType<Class<R>, Any>>
    ): Iterator<R> {
        return new IteratorFilteringIs(src, matcher);
    }
    
    #if (haxe_ver < 4.3) // On 4.2.5 and lower, e.g. Abstract<Int> cannot unify through EitherType
    
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
    public static extern inline overload function filterIs<T, R>(
        src: Iterator<T>,
        matcher: Any
    ): Iterator<R> {
        return new IteratorFilteringIs(src, matcher);
    }
    #end
    
    /**
        Filters the source iterator, yielding only items that are not `null`.
        @param src The source iterator.
        @return A new iterator.
    **/
    public static extern inline overload function filterNonNull<T>(
        src: Iterator<Null<T>>
    ): Iterator<T> {
        return new IteratorFilteringNonNull(src);
    }
    
    /**
        Filters the source iterator, yielding only items that are not `None`.
        @param src The source iterator.
        @return A new iterator.
    **/
    public static extern inline overload function filterSome<T>(
        src: Iterator<Option<T>>
    ): Iterator<T> {
        return new IteratorFilteringSome(src);
    }
}
