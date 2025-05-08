// SPDX-License-Identifier: MIT
package lazylambda.ops;

final class Count {

    /**
        Returns the number of items in the source iterator.
        @param src The source iterator.
        @return The number of items.
    **/
    public static extern inline overload function count<S: Iterator<T>, T>(src: S): Int {
        var count: Int = 0;
        for (item in src) {
            count += 1;
        }
        return count;
    }
    
    /**
        Returns the number of items in the source iterator that match the given predicate.
        @param src The source iterator.
        @param predicate The predicate to match.
        @return The number of items.
    **/
    public static extern inline overload function count<S: Iterator<T>, T>(
        src: S,
        predicate: (item: T) -> Bool
    ): Int {
        var count: Int = 0;
        for (item in src) {
            if (predicate(item)) {
                count += 1;
            }
        }
        return count;
    }
}
