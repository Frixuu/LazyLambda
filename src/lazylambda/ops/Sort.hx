// SPDX-License-Identifier: MIT
package lazylambda.ops;

import lazylambda.ds.Comparable;
import lazylambda.iterators.IIterator;
import lazylambda.iterators.IteratorSorting;
import lazylambda.iterators.IteratorSortingBy;

final class Sort {

    /**
        Returns items from the source iterator, sorted using a provided comparator function.
        @param src The source iterator.
        @param comparator The comparator function to use.
        @return A new iterator.
    **/
    @:generic
    public static extern inline overload function sortedWith<S: Iterator<T>, T>(
        src: S,
        comparator: (lhs: T, rhs: T) -> Int
    ): IIterator<T> {
        return new IteratorSorting(src, comparator);
    }
    
    /**
        Returns items from the source iterator in a natural order.
        @param src The source iterator.
        @return A new iterator.
    **/
    @:generic
    public static extern inline overload function sorted<S_Comp: Iterator<T>, T: Comparable<T>>(
        src: S_Comp
    ): IIterator<T> {
        return sortedWith(src, (a: T, b: T) -> a.compareTo(b));
    }
    
    /**
        Returns items from the source iterator in a natural order.
        @param src The source iterator.
        @return A new iterator.
    **/
    @:generic
    public static extern inline overload function sorted<S_Int: Iterator<Int>>(
        src: S_Int
    ): IIterator<Int> {
        return sortedWith(src, (a: Int, b: Int) -> a - b);
    }
    
    /**
        Returns items from the source iterator in a natural order.
        @param src The source iterator.
        @return A new iterator.
    **/
    @:generic
    public static extern inline overload function sorted<S_String: Iterator<String>>(
        src: S_String
    ): IIterator<String> {
        return sortedWith(src, (a: String, b: String) -> if (a < b) {
            -1;
        } else if (a > b) {
            1;
        } else {
            0;
        });
    }
    
    /**
        Returns items from the source iterator, sorted using a provided key selector function.
        @param src The source iterator.
        @param selector The selector function to use.
        @return A new iterator.
    **/
    @:generic
    public static extern inline overload function sortedBy<S: Iterator<T>, T>(
        src: S,
        selector: (item: T) -> Int
    ): IIterator<T> {
        return new IteratorSortingBy(src, selector, (a: Int, b: Int) -> a - b);
    }
}
