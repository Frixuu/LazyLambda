// SPDX-License-Identifier: MIT
package lazylambda.ops;

import lazylambda.iterators.IteratorMapping;
import lazylambda.iterators.IteratorValues;

final class Map {

    /**
        Applies the given function to each item in the source iterator.
        @param src The source iterator.
        @param transform The function to apply.
        @return A new iterator.
    **/
    public static extern inline overload function map<T, R>(
        src: Iterator<T>,
        transform: (T) -> R
    ): Iterator<R> {
        return new IteratorMapping(src, transform);
    }
    
    /**
        For a given key-value source iterator, yields the values only.
        @param src The source iterator.
        @return A new iterator.
    **/
    public static extern inline overload function values<K, V>(
        src: KeyValueIterator<K, V>
    ): Iterator<V> {
        return new IteratorValues(src);
    }
}
