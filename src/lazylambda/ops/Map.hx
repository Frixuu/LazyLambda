// SPDX-License-Identifier: MIT
package lazylambda.ops;

import lazylambda.iterators.IIterator;
import lazylambda.iterators.IteratorMapping;
import lazylambda.iterators.IteratorMappingNonNull;
import lazylambda.iterators.IteratorValues;

final class Map {

    /**
        Applies the given function to each item in the source iterator.
        @param src The source iterator.
        @param transform The function to apply.
        @return A new iterator.
    **/
    @:generic
    public static extern inline overload function map<S: Iterator<T>, T, R>(
        src: S,
        transform: (T) -> R
    ): IIterator<R> {
        return new IteratorMapping(src, transform);
    }
    
    /**
        Applies the given function to each item in the source iterator,
        filtering out null results.
        @param src The source iterator.
        @param transform The function to apply.
        @return A new iterator.
    **/
    @:generic
    public static extern inline overload function mapNonNull<S: Iterator<T>, T, R>(
        src: S,
        transform: (T) -> Null<R>
    ): IIterator<R> {
        return new IteratorMappingNonNull(src, transform);
    }
    
    /**
        For a given key-value source iterator, yields the values only.
        @param src The source iterator.
        @return A new iterator.
    **/
    @:generic
    public static extern inline overload function values<S: KeyValueIterator<K, V>, K, V>(
        src: S
    ): IIterator<V> {
        return new IteratorValues(src);
    }
}
