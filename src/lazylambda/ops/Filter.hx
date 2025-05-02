// SPDX-License-Identifier: MIT
package lazylambda.ops;

import haxe.ds.Option;
import lazylambda.iterators.IteratorFiltering;
import lazylambda.iterators.IteratorFilteringIs;
import lazylambda.iterators.IteratorFilteringNonNull;
import lazylambda.iterators.IteratorFilteringSome;

final class Filter {

    public static inline function filter<T>(src: Iterator<T>, predicate: (T) -> Bool): Iterator<T> {
        return new IteratorFiltering(src, predicate);
    }
    
    public static extern inline overload function filterIs<T, R>(
        src: Iterator<T>,
        matcher: Class<R>
    ): Iterator<R> {
        return new IteratorFilteringIs(src, matcher);
    }
    
    public static extern inline overload function filterIs<T, R>(
        src: Iterator<T>,
        matcher: Any
    ): Iterator<R> {
        return new IteratorFilteringIs(src, matcher);
    }
    
    public static inline function filterNonNull<T>(src: Iterator<Null<T>>): Iterator<T> {
        return new IteratorFilteringNonNull(src);
    }
    
    public static inline function filterSome<T>(src: Iterator<Option<T>>): Iterator<T> {
        return new IteratorFilteringSome(src);
    }
}
