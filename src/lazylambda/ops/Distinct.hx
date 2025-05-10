// SPDX-License-Identifier: MIT
package lazylambda.ops;

import haxe.ds.IntMap;
import haxe.ds.ObjectMap;
import haxe.ds.StringMap;
import lazylambda.ds.Comparable;
import lazylambda.ds.RbTreeSet;
import lazylambda.iterators.IIterator;
import lazylambda.iterators.IteratorFiltering;

final class Distinct {

    /**
        Returns only unique items from the source iterator.
        @param src The source iterator.
        @return A new iterator.
    **/
    @:generic
    public static extern inline overload function distinct<S_Comp: Iterator<T>, T: Comparable<T>>(
        src: S_Comp
    ): IIterator<T> {
        final treeSet = new RbTreeSet<T>((a, b) -> a.compareTo(b));
        return new IteratorFiltering(src, item -> treeSet.insert(item));
    }
    
    /**
        Returns only unique items from the source iterator.
        @param src The source iterator.
        @return A new iterator.
    **/
    @:generic
    public static extern inline overload function distinct<S_Int: Iterator<Int>>(
        src: S_Int
    ): IIterator<Int> {
        final set: IntMap<Bool> = new IntMap();
        return new IteratorFiltering(src, item -> {
            final wasAbsent = !set.exists(item);
            if (wasAbsent) {
                set.set(item, true);
            }
            return wasAbsent;
        });
    }
    
    /**
        Returns only unique items from the source iterator.
        @param src The source iterator.
        @return A new iterator.
    **/
    @:generic
    public static extern inline overload function distinct<S_String: Iterator<String>>(
        src: S_String
    ): IIterator<String> {
        final set: StringMap<Bool> = new StringMap();
        return new IteratorFiltering(src, item -> {
            final wasAbsent = !set.exists(item);
            if (wasAbsent) {
                set.set(item, true);
            }
            return wasAbsent;
        });
    }
    
    /**
        Returns only unique references from the source iterator.
        @param src The source iterator.
        @return A new iterator.
    **/
    @:generic
    public static extern inline overload function distinctByIdentity<S_Ref: Iterator<T>, T: {}>(
        src: S_Ref
    ): IIterator<T> {
        final set: ObjectMap<T, Bool> = new ObjectMap();
        return new IteratorFiltering(src, item -> {
            final wasAbsent = !set.exists(item);
            if (wasAbsent) {
                set.set(item, true);
            }
            return wasAbsent;
        });
    }
}
