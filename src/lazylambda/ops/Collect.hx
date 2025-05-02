// SPDX-License-Identifier: MIT
package lazylambda.ops;

import haxe.ds.Vector;

final class Collect {

    public static inline function toArray<T>(src: Iterator<T>): Array<T> {
        return [for (item in src) item];
    }
    
    public static inline function toVector<T>(src: Iterator<T>): Vector<T> {
        // We need to know the size beforehand anyway
        return Vector.fromArrayCopy(toArray(src));
    }
    
    public static inline function toList<T>(src: Iterator<T>): List<T> {
        final list = new List<T>();
        for (item in src) {
            list.add(item);
        }
        return list;
    }
    
    @:generic
    public static extern inline overload function toMap<K, V>(
        src: KeyValueIterator<K, V>
    ): haxe.ds.Map<K, V> {
        return [for (key => value in src) key => value];
    }
    
    @:generic
    public static extern inline overload function toMap<T, K, V>(
        src: Iterator<T>,
        keySelector: (T) -> K,
        valueSelector: (T) -> V
    ): haxe.ds.Map<K, V> {
        return [for (item in src) keySelector(item) => valueSelector(item)];
    }
}
