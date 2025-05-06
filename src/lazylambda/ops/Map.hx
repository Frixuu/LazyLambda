// SPDX-License-Identifier: MIT
package lazylambda.ops;

import lazylambda.iterators.IteratorMapping;
import lazylambda.iterators.IteratorValues;

final class Map {

    public static extern inline overload function map<T, R>(
        src: Iterator<T>,
        transform: (T) -> R
    ): Iterator<R> {
        return new IteratorMapping(src, transform);
    }
    
    public static extern inline overload function values<K, V>(
        src: KeyValueIterator<K, V>
    ): Iterator<V> {
        return new IteratorValues(src);
    }
}
