// SPDX-License-Identifier: MIT
package lazylambda.ops;

import haxe.ds.Option;
import haxe.extern.EitherType;
import lazylambda.iterators.IteratorFiltering;
import lazylambda.iterators.IteratorFilteringIs;
import lazylambda.iterators.IteratorFilteringNonNull;
import lazylambda.iterators.IteratorFilteringSome;

final class Filter {

    public static extern inline overload function filter<T>(
        src: Iterator<T>,
        predicate: (item: T) -> Bool
    ): Iterator<T> {
        return new IteratorFiltering(src, predicate);
    }
    
    public static extern inline overload function filterIs<T, R>(
        src: Iterator<T>,
        matcher: EitherType<Enum<R>, EitherType<Class<R>, Any>>
    ): Iterator<R> {
        return new IteratorFilteringIs(src, matcher);
    }
    
    #if (haxe_ver < 4.3)
    public static extern inline overload function filterIs<T, R>(
        src: Iterator<T>,
        matcher: Any
    ): Iterator<R> {
        return new IteratorFilteringIs(src, matcher);
    }
    #end
    
    public static extern inline overload function filterNonNull<T>(
        src: Iterator<Null<T>>
    ): Iterator<T> {
        return new IteratorFilteringNonNull(src);
    }
    
    public static extern inline overload function filterSome<T>(
        src: Iterator<Option<T>>
    ): Iterator<T> {
        return new IteratorFilteringSome(src);
    }
}
