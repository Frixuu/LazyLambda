// SPDX-License-Identifier: MIT
package lazylambda.ops;

import haxe.ds.List;
import haxe.ds.Vector;

final class Collect {

    /**
        Drains the source iterator, collecting all of its items into an `Array`.
        @param src The source iterator.
        @return A new array.
    **/
    public static inline function toArray<T>(src: Iterator<T>): Array<T> {
        return [for (item in src) item];
    }
    
    /**
        Drains the source iterator, collecting all of its items into a `Vector`.
        @param src The source iterator.
        @return A new vector.
    **/
    public static inline function toVector<T>(src: Iterator<T>): Vector<T> {
        // We need to know the size beforehand anyway
        return Vector.fromArrayCopy(toArray(src));
    }
    
    /**
        Drains the source iterator, collecting all of its items into a `List`.
        @param src The source iterator.
        @return A new linked list.
    **/
    public static inline function toList<T>(src: Iterator<T>): List<T> {
        final list = new List<T>();
        for (item in src) {
            list.add(item);
        }
        return list;
    }
    
    /**
        Drains the source iterator, collecting all of its items into a `Map`.
        @param src The source iterator.
        @return A new map.
    **/
    @:generic
    public static extern inline overload function toMap<T: KeyValueIterator<K, V>, K, V>(
        src: T
    ): haxe.ds.Map<K, V> {
        return [for (key => value in src) key => value];
    }
    
    /**
        Drains the source iterator, collecting all of its items into a `Map`.
        @param src The source iterator.
        @param keySelector A function that produces a key for each item.
        @param valueSelector A function that produces a value for each item.
        @return A new map.
    **/
    @:generic
    public static extern inline overload function toMap<T, K, V>(
        src: Iterator<T>,
        keySelector: (T) -> K,
        valueSelector: (T) -> V
    ): haxe.ds.Map<K, V> {
        return [for (item in src) keySelector(item) => valueSelector(item)];
    }
}
