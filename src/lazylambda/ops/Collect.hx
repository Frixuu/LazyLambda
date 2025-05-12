// SPDX-License-Identifier: MIT
package lazylambda.ops;

import haxe.ds.List;
import haxe.ds.Vector;

final class Collect {

    /**
        Collects all of the source iterator's items into an `Array`.
        @param src The source iterator.
        @return A new array.
    **/
    @:generic
    public static extern inline overload function toArray<S: Iterator<T>, T>(src: S): Array<T> {
        return [for (item in src) item];
    }
    
    /**
        Collects all of the source iterator's items into a `Vector`.
        @param src The source iterator.
        @return A new vector.
    **/
    @:generic
    public static extern inline overload function toVector<S: Iterator<T>, T>(src: S): Vector<T> {
        // We need to know the size beforehand anyway
        return Vector.fromArrayCopy(toArray(src));
    }
    
    /**
        Collects all of the source iterator's items into a `List`.
        @param src The source iterator.
        @return A new linked list.
    **/
    @:generic
    public static extern inline overload function toList<S: Iterator<T>, T>(src: S): List<T> {
        final list = new List<T>();
        while (src.hasNext()) {
            list.add(src.next());
        }
        return list;
    }
    
    /**
        Collects all of the source iterator's items into a `Map`.
        @param src The source iterator.
        @return A new map.
    **/
    @:generic
    public static extern inline overload function toMap<S_0: KeyValueIterator<K, V>, K, V>(
        src: S_0
    ): haxe.ds.Map<K, V> {
        return [for (key => value in src) key => value];
    }
    
    /**
        Collects all of the source iterator's items into a `Map`.
        @param src The source iterator.
        @param keySelector A function that produces a key for each item.
        @param valueSelector A function that produces a value for each item.
        @return A new map.
    **/
    @:generic
    public static extern inline overload function toMap<S_2: Iterator<T>, T, K, V>(
        src: S_2,
        keySelector: (T) -> K,
        valueSelector: (T) -> V
    ): haxe.ds.Map<K, V> {
        return [for (item in src) keySelector(item) => valueSelector(item)];
    }
}
